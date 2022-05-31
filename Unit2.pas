unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    OpenMenuItem: TMenuItem;
    SaveMenuItem: TMenuItem;
    SaveAsMenuItem: TMenuItem;
    StringGrid1: TStringGrid;
    OpenDialog1: TOpenDialog;
    AddFacilityButton: TButton;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SaveAsMenuItemClick(Sender: TObject);
    procedure OpenMenuItemClick(Sender: TObject);
    procedure SaveMenuItemClick(Sender: TObject);
    procedure AddFacilityButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  FacilityRecord = record
    category, address, ownerFullName, price, description, customerFullName, saleDate: string[30];
  end;
  procedure AddFacilityToStringGrid(facility: FacilityRecord);

const fields: array of String = ['Вид объекта', 'Адрес', 'ФИО владельца', 'Стоимость', 'Описание', 'ФИО покупателя', 'Дата продажи'];

var
  Form2: TForm2;
  storageFile: file of FacilityRecord;
  storageFilePath: string;
  i, j: integer;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure AddFacilityToStringGrid(facility: FacilityRecord);
begin
  Form2.StringGrid1.RowCount := Form2.StringGrid1.RowCount + 1;
  Form2.StringGrid1.FixedRows := 1;

  const rowIndex = Form2.StringGrid1.RowCount - 1;

  Form2.StringGrid1.Cells[0, rowIndex] := facility.category;
  Form2.StringGrid1.Cells[1, rowIndex] := facility.address;
  Form2.StringGrid1.Cells[2, rowIndex] := facility.ownerFullName;
  Form2.StringGrid1.Cells[3, rowIndex] := facility.price;
  Form2.StringGrid1.Cells[4, rowIndex] := facility.description;
  Form2.StringGrid1.Cells[5, rowIndex] := facility.customerFullName;
  Form2.StringGrid1.Cells[6, rowIndex] := facility.saleDate;
end;

function createFacilityFromStringGrid(rowIndex: integer): FacilityRecord;
var facility: FacilityRecord;
begin
  facility.category := Form2.StringGrid1.Cells[0, rowIndex];
  facility.address := Form2.StringGrid1.Cells[1, rowIndex];
  facility.ownerFullName := Form2.StringGrid1.Cells[2, rowIndex];
  facility.price := Form2.StringGrid1.Cells[3, rowIndex];
  facility.description := Form2.StringGrid1.Cells[4, rowIndex];
  facility.customerFullName := Form2.StringGrid1.Cells[5, rowIndex];
  facility.saleDate := Form2.StringGrid1.Cells[6, rowIndex];
  result := facility;
end;

procedure SetStorageFilePath(path: string);
begin
  storageFilePath := path;
  Form2.Caption := 'Основная форма - ' + storageFilePath;
end;

procedure TForm2.AddFacilityButtonClick(Sender: TObject);
begin
  Form3.ShowModal;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  StringGrid1.DefaultColWidth := round(Form2.ClientWidth / Length(fields)) - 5;
  StringGrid1.ColCount := Length(fields);

  for i := 0 to Length(fields) - 1 do
    StringGrid1.Cells[i, 0] := fields[i];
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Close;
end;

procedure TForm2.OpenMenuItemClick(Sender: TObject);
var group: FacilityRecord;
begin
  if OpenDialog1.Execute <> true then exit;

  StringGrid1.RowCount := 1;

  AssignFile(storageFile, OpenDialog1.FileName);
  Reset(storageFile);

  for i := 1 to Filesize(storageFile) do
  begin
    read(storageFile, group);
    AddFacilityToStringGrid(group);
  end;

  SetStorageFilePath(OpenDialog1.FileName);
  CloseFile(storageFile);
end;

procedure TForm2.SaveAsMenuItemClick(Sender: TObject);
begin
  if SaveDialog1.Execute <> true then exit;

  AssignFile(storageFile, SaveDialog1.FileName);
  Rewrite(storageFile);

  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    var facility: FacilityRecord := createFacilityFromStringGrid(i);
    write(storageFile, facility);
  end;

  SetStorageFilePath(SaveDialog1.FileName);
  CloseFile(storageFile);
end;

procedure TForm2.SaveMenuItemClick(Sender: TObject);
begin
  if length(storageFilePath) = 0 then
  begin
    SaveAsMenuItemClick(SaveAsMenuItem);
    exit;
  end;

  AssignFile(storageFile, storageFilePath);
  Rewrite(storageFile);

  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    var facility: FacilityRecord := createFacilityFromStringGrid(i);
    write(storageFile, facility);
  end;

  CloseFile(storageFile);
end;

end.
