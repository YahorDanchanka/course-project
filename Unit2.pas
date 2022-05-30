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
    AddPerfomanceButton: TButton;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SaveAsMenuItemClick(Sender: TObject);
    procedure OpenMenuItemClick(Sender: TObject);
    procedure SaveMenuItemClick(Sender: TObject);
    procedure AddPerfomanceButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  PerformanceRecord = record
    title, duration, ageLimit, category, price, premiereDate, days: string[30];
  end;
  procedure AddPerfomanceToStringGrid(perfomance: PerformanceRecord);

var
  Form2: TForm2;
  storageFile: file of PerformanceRecord;
  storageFilePath: string;
  i, j: integer;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure AddPerfomanceToStringGrid(perfomance: PerformanceRecord);
begin
  Form2.StringGrid1.RowCount := Form2.StringGrid1.RowCount + 1;
  Form2.StringGrid1.FixedRows := 1;

  const rowIndex = Form2.StringGrid1.RowCount - 1;

  Form2.StringGrid1.Cells[0, rowIndex] := perfomance.title;
  Form2.StringGrid1.Cells[1, rowIndex] := perfomance.duration;
  Form2.StringGrid1.Cells[2, rowIndex] := perfomance.ageLimit;
  Form2.StringGrid1.Cells[3, rowIndex] := perfomance.category;
  Form2.StringGrid1.Cells[4, rowIndex] := perfomance.price;
  Form2.StringGrid1.Cells[5, rowIndex] := perfomance.premiereDate;
  Form2.StringGrid1.Cells[6, rowIndex] := perfomance.days;
end;

function createGroupFromStringGrid(rowIndex: integer): PerformanceRecord;
var perfomance: PerformanceRecord;
begin
  perfomance.title := Form2.StringGrid1.Cells[0, rowIndex];
  perfomance.duration := Form2.StringGrid1.Cells[1, rowIndex];
  perfomance.ageLimit := Form2.StringGrid1.Cells[2, rowIndex];
  perfomance.category := Form2.StringGrid1.Cells[3, rowIndex];
  perfomance.price := Form2.StringGrid1.Cells[4, rowIndex];
  perfomance.premiereDate := Form2.StringGrid1.Cells[5, rowIndex];
  perfomance.days := Form2.StringGrid1.Cells[6, rowIndex];
  result := perfomance;
end;

procedure SetStorageFilePath(path: string);
begin
  storageFilePath := path;
  Form2.Caption := 'Основная форма - ' + storageFilePath;
end;

procedure TForm2.AddPerfomanceButtonClick(Sender: TObject);
begin
  Form3.ShowModal;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  // Устанавливаем максимальную ширину колонок без полосы прокрутки
  StringGrid1.DefaultColWidth := round(Form2.ClientWidth / 7) - 5;
  StringGrid1.ColCount := 7;

  StringGrid1.Cells[0, 0] := 'Название спектакля';
  StringGrid1.Cells[1, 0] := 'Длительность';
  StringGrid1.Cells[2, 0] := 'Возрастное ограничение';
  StringGrid1.Cells[3, 0] := 'Жанр';
  StringGrid1.Cells[4, 0] := 'Стоимость';
  StringGrid1.Cells[5, 0] := 'Дата премьеры';
  StringGrid1.Cells[6, 0] := 'Дни показа';
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Close;
end;

procedure TForm2.OpenMenuItemClick(Sender: TObject);
var group: PerformanceRecord;
begin
  if OpenDialog1.Execute <> true then exit;

  StringGrid1.RowCount := 1;

  AssignFile(storageFile, OpenDialog1.FileName);
  Reset(storageFile);

  for i := 1 to Filesize(storageFile) do
  begin
    read(storageFile, group);
    AddPerfomanceToStringGrid(group);
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
    var group: PerformanceRecord := createGroupFromStringGrid(i);
    write(storageFile, group);
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
    var group: PerformanceRecord := createGroupFromStringGrid(i);
    write(storageFile, group);
  end;

  CloseFile(storageFile);
end;

end.
