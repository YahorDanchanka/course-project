unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.StdCtrls, System.Generics.Collections,
  System.Generics.Defaults, DateUtils;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    OpenMenuItem: TMenuItem;
    SaveMenuItem: TMenuItem;
    SaveAsMenuItem: TMenuItem;
    StringGrid1: TStringGrid;
    OpenDialog1: TOpenDialog;
    AddSaleButton: TButton;
    N2: TMenuItem;
    N3: TMenuItem;
    TitleSortAscMenuItem: TMenuItem;
    TitleSortDescMenuItem: TMenuItem;
    N4: TMenuItem;
    FoodSetSortAscMenuItem: TMenuItem;
    FoodSetSortDescMenuItem: TMenuItem;
    N5: TMenuItem;
    PriceSortAscMenuItem: TMenuItem;
    PriceSortDescMenuItem: TMenuItem;
    N6: TMenuItem;
    PercentSortAscMenuItem: TMenuItem;
    PercentSortDescMenuItem: TMenuItem;
    N7: TMenuItem;
    StartDateSortAscMenuItem: TMenuItem;
    StartDateSortDescMenuItem: TMenuItem;
    N8: TMenuItem;
    EndDateSortAscMenuItem: TMenuItem;
    EndDateSortDescMenuItem: TMenuItem;
    N9: TMenuItem;
    DescriptionSortAscMenuItem: TMenuItem;
    DescriptionSortDescMenuItem: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SaveAsMenuItemClick(Sender: TObject);
    procedure AddSaleButtonClick(Sender: TObject);
    procedure OpenMenuItemClick(Sender: TObject);
    procedure SaveMenuItemClick(Sender: TObject);
    procedure TitleSortAscMenuItemClick(Sender: TObject);
    procedure TitleSortDescMenuItemClick(Sender: TObject);
    procedure FoodSetSortAscMenuItemClick(Sender: TObject);
    procedure FoodSetSortDescMenuItemClick(Sender: TObject);
    procedure PriceSortAscMenuItemClick(Sender: TObject);
    procedure PriceSortDescMenuItemClick(Sender: TObject);
    procedure PercentSortAscMenuItemClick(Sender: TObject);
    procedure PercentSortDescMenuItemClick(Sender: TObject);
    procedure StartDateSortAscMenuItemClick(Sender: TObject);
    procedure StartDateSortDescMenuItemClick(Sender: TObject);
    procedure EndDateSortAscMenuItemClick(Sender: TObject);
    procedure EndDateSortDescMenuItemClick(Sender: TObject);
    procedure DescriptionSortAscMenuItemClick(Sender: TObject);
    procedure DescriptionSortDescMenuItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  saleRecord = record
    title, foodSet, price, percent, startDate, endDate, description: string[20];
  end;
  procedure AddSaleToStringGrid(sale: saleRecord);

const fields: array of String = ['Название ресторана', 'Название набора', 'Стоимость', 'Процент скидки', 'Срок начала', 'Срок окончания', 'Описание'];

var
  Form2: TForm2;
  storageFile: file of saleRecord;
  storageFilePath: string;
  i, j: integer;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure ReverseStringGrid();
var
  i, j, k, cnt: integer;
  s: string;
begin
  cnt := Form2.StringGrid1.RowCount;
  k := Form2.StringGrid1.RowCount div 2;

  for j := 0 to 6 do
    for i := 1 to k do
    begin
      s := Form2.StringGrid1.Cells[j,i];
      Form2.StringGrid1.Cells[j,i] := Form2.StringGrid1.Cells[j,cnt-i];
      Form2.StringGrid1.Cells[j,cnt-i] := s;
    end;
end;

procedure UpdateStringGridFromFile(path: string);
var sale: saleRecord;
begin
  Form2.StringGrid1.RowCount := 1;

  AssignFile(storageFile, path);
  Reset(storageFile);

  for i := 1 to Filesize(storageFile) do
  begin
    read(storageFile, sale);
    AddSaleToStringGrid(sale);
  end;

  CloseFile(storageFile);
end;

procedure AddSaleToStringGrid(sale: saleRecord);
begin
  Form2.StringGrid1.RowCount := Form2.StringGrid1.RowCount + 1;
  Form2.StringGrid1.FixedRows := 1;

  const rowIndex = Form2.StringGrid1.RowCount - 1;

  Form2.StringGrid1.Cells[0, rowIndex] := sale.title;
  Form2.StringGrid1.Cells[1, rowIndex] := sale.foodSet;
  Form2.StringGrid1.Cells[2, rowIndex] := sale.price;
  Form2.StringGrid1.Cells[3, rowIndex] := sale.percent;
  Form2.StringGrid1.Cells[4, rowIndex] := sale.startDate;
  Form2.StringGrid1.Cells[5, rowIndex] := sale.endDate;
  Form2.StringGrid1.Cells[6, rowIndex] := sale.description;
end;

function createSaleFromStringGrid(rowIndex: integer): saleRecord;
var sale: saleRecord;
begin
  sale.title := Form2.StringGrid1.Cells[0, rowIndex];
  sale.foodSet := Form2.StringGrid1.Cells[1, rowIndex];
  sale.price := Form2.StringGrid1.Cells[2, rowIndex];
  sale.percent := Form2.StringGrid1.Cells[3, rowIndex];
  sale.startDate := Form2.StringGrid1.Cells[4, rowIndex];
  sale.endDate := Form2.StringGrid1.Cells[5, rowIndex];
  sale.description := Form2.StringGrid1.Cells[6, rowIndex];
  result := sale;
end;

procedure SetStorageFilePath(path: string);
begin
  storageFilePath := path;
  Form2.Caption := 'Основная форма - ' + storageFilePath;
end;

procedure TForm2.AddSaleButtonClick(Sender: TObject);
begin
  Form3.ShowModal;
end;

procedure TForm2.DescriptionSortAscMenuItemClick(Sender: TObject);
var sales: array of saleRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(sales, StringGrid1.RowCount - 1);

  for i := 1 to Length(sales) do
    sales[i - 1] := createSaleFromStringGrid(i);

  TArray.Sort<saleRecord>(sales, TDelegatedComparer<saleRecord>.Construct(
    function(const Left, Right: saleRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.description, right.description);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(sales) - 1 do
    AddSaleToStringGrid(sales[i]);
end;

procedure TForm2.DescriptionSortDescMenuItemClick(Sender: TObject);
begin
  DescriptionSortAscMenuItemClick(DescriptionSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.EndDateSortAscMenuItemClick(Sender: TObject);
var sales: array of saleRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(sales, StringGrid1.RowCount - 1);

  for i := 1 to Length(sales) do
    sales[i - 1] := createSaleFromStringGrid(i);

  TArray.Sort<saleRecord>(sales, TDelegatedComparer<saleRecord>.Construct(
    function(const Left, Right: saleRecord): integer
    begin
      Result := TComparer<integer>.Default.Compare(DateTimeToUnix(StrToDateTime(left.endDate)), DateTimeToUnix(StrToDateTime(right.endDate)));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(sales) - 1 do
    AddSaleToStringGrid(sales[i]);
end;

procedure TForm2.EndDateSortDescMenuItemClick(Sender: TObject);
begin
  EndDateSortAscMenuItemClick(EndDateSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.FoodSetSortAscMenuItemClick(Sender: TObject);
var sales: array of saleRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(sales, StringGrid1.RowCount - 1);

  for i := 1 to Length(sales) do
    sales[i - 1] := createSaleFromStringGrid(i);

  TArray.Sort<saleRecord>(sales, TDelegatedComparer<saleRecord>.Construct(
    function(const Left, Right: saleRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.foodSet, right.foodSet);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(sales) - 1 do
    AddSaleToStringGrid(sales[i]);
end;

procedure TForm2.FoodSetSortDescMenuItemClick(Sender: TObject);
begin
  FoodSetSortAscMenuItemClick(FoodSetSortAscMenuItem);
  ReverseStringGrid();
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
var group: saleRecord;
begin
  if OpenDialog1.Execute <> true then exit;

  StringGrid1.RowCount := 1;

  AssignFile(storageFile, OpenDialog1.FileName);
  Reset(storageFile);

  for i := 1 to Filesize(storageFile) do
  begin
    read(storageFile, group);
    AddSaleToStringGrid(group);
  end;

  SetStorageFilePath(OpenDialog1.FileName);
  CloseFile(storageFile);
end;

procedure TForm2.PercentSortAscMenuItemClick(Sender: TObject);
var sales: array of saleRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(sales, StringGrid1.RowCount - 1);

  for i := 1 to Length(sales) do
    sales[i - 1] := createSaleFromStringGrid(i);

  TArray.Sort<saleRecord>(sales, TDelegatedComparer<saleRecord>.Construct(
    function(const Left, Right: saleRecord): integer
    begin
      Result := TComparer<real>.Default.Compare(StrToFloat(left.percent), StrToFloat(right.percent));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(sales) - 1 do
    AddSaleToStringGrid(sales[i]);
end;

procedure TForm2.PercentSortDescMenuItemClick(Sender: TObject);
begin
  PercentSortAscMenuItemClick(PercentSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.PriceSortAscMenuItemClick(Sender: TObject);
var sales: array of saleRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(sales, StringGrid1.RowCount - 1);

  for i := 1 to Length(sales) do
    sales[i - 1] := createSaleFromStringGrid(i);

  TArray.Sort<saleRecord>(sales, TDelegatedComparer<saleRecord>.Construct(
    function(const Left, Right: saleRecord): integer
    begin
      Result := TComparer<real>.Default.Compare(StrToFloat(left.price), StrToFloat(right.price));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(sales) - 1 do
    AddSaleToStringGrid(sales[i]);
end;

procedure TForm2.PriceSortDescMenuItemClick(Sender: TObject);
begin
  PriceSortAscMenuItemClick(PriceSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.SaveAsMenuItemClick(Sender: TObject);
begin
  if OpenDialog1.Execute <> true then exit;

  AssignFile(storageFile, OpenDialog1.FileName);
  Rewrite(storageFile);

  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    var group: saleRecord := createSaleFromStringGrid(i);
    write(storageFile, group);
  end;

  SetStorageFilePath(OpenDialog1.FileName);
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
    var sale: saleRecord := createSaleFromStringGrid(i);
    write(storageFile, sale);
  end;

  CloseFile(storageFile);
end;

procedure TForm2.StartDateSortAscMenuItemClick(Sender: TObject);
var sales: array of saleRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(sales, StringGrid1.RowCount - 1);

  for i := 1 to Length(sales) do
    sales[i - 1] := createSaleFromStringGrid(i);

  TArray.Sort<saleRecord>(sales, TDelegatedComparer<saleRecord>.Construct(
    function(const Left, Right: saleRecord): integer
    begin
      Result := TComparer<integer>.Default.Compare(DateTimeToUnix(StrToDateTime(left.startDate)), DateTimeToUnix(StrToDateTime(right.startDate)));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(sales) - 1 do
    AddSaleToStringGrid(sales[i]);
end;

procedure TForm2.StartDateSortDescMenuItemClick(Sender: TObject);
begin
  StartDateSortAscMenuItemClick(StartDateSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.TitleSortAscMenuItemClick(Sender: TObject);
var sales: array of saleRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(sales, StringGrid1.RowCount - 1);

  for i := 1 to Length(sales) do
    sales[i - 1] := createSaleFromStringGrid(i);

  TArray.Sort<saleRecord>(sales, TDelegatedComparer<saleRecord>.Construct(
    function(const Left, Right: saleRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.title, right.title);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(sales) - 1 do
    AddSaleToStringGrid(sales[i]);
end;

procedure TForm2.TitleSortDescMenuItemClick(Sender: TObject);
begin
  TitleSortAscMenuItemClick(TitleSortAscMenuItem);
  ReverseStringGrid();
end;

end.
