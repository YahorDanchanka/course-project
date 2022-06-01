unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.StdCtrls,
  System.Generics.Collections, System.Generics.Defaults, DateUtils;

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
    N2: TMenuItem;
    N3: TMenuItem;
    CategorySortAscMenuItem: TMenuItem;
    CategorySortDescMenuItem: TMenuItem;
    N4: TMenuItem;
    AddressSortAscMenuItem: TMenuItem;
    AddressSortDescMenuItem: TMenuItem;
    N5: TMenuItem;
    OwnerFullnameSortAscMenuItem: TMenuItem;
    OwnerFullnameSortDescMenuItem: TMenuItem;
    N6: TMenuItem;
    PriceSortAscMenuItem: TMenuItem;
    PriceSortDescMenuItem: TMenuItem;
    N7: TMenuItem;
    DescriptionSortAscMenuItem: TMenuItem;
    DescriptionSortDescMenuItem: TMenuItem;
    N8: TMenuItem;
    CustomerFullnameSortAscMenuItem: TMenuItem;
    CustomerFullnameSortDescMenuItem: TMenuItem;
    N9: TMenuItem;
    SaleDateSortAscMenuItem: TMenuItem;
    SaleDateSortDescMenuItem: TMenuItem;
    N10: TMenuItem;
    CategoryFilterMenuItem: TMenuItem;
    AddressFilterMenuItem: TMenuItem;
    OwnerFullnameFilterMenuItem: TMenuItem;
    PriceFilterMenuItem: TMenuItem;
    DescriptionFilterMenuItem: TMenuItem;
    CustomerFullnameFilterMenuItem: TMenuItem;
    SaleDateFilterMenuItem: TMenuItem;
    SearchEdit: TEdit;
    N11: TMenuItem;
    DeleteFunction: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SaveAsMenuItemClick(Sender: TObject);
    procedure OpenMenuItemClick(Sender: TObject);
    procedure SaveMenuItemClick(Sender: TObject);
    procedure AddFacilityButtonClick(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure CategorySortAscMenuItemClick(Sender: TObject);
    procedure CategorySortDescMenuItemClick(Sender: TObject);
    procedure AddressSortAscMenuItemClick(Sender: TObject);
    procedure AddressSortDescMenuItemClick(Sender: TObject);
    procedure OwnerFullnameSortAscMenuItemClick(Sender: TObject);
    procedure OwnerFullnameSortDescMenuItemClick(Sender: TObject);
    procedure PriceSortAscMenuItemClick(Sender: TObject);
    procedure PriceSortDescMenuItemClick(Sender: TObject);
    procedure DescriptionSortAscMenuItemClick(Sender: TObject);
    procedure DescriptionSortDescMenuItemClick(Sender: TObject);
    procedure CustomerFullnameSortAscMenuItemClick(Sender: TObject);
    procedure CustomerFullnameSortDescMenuItemClick(Sender: TObject);
    procedure SaleDateSortAscMenuItemClick(Sender: TObject);
    procedure SaleDateSortDescMenuItemClick(Sender: TObject);
    procedure CategoryFilterMenuItemClick(Sender: TObject);
    procedure AddressFilterMenuItemClick(Sender: TObject);
    procedure OwnerFullnameFilterMenuItemClick(Sender: TObject);
    procedure PriceFilterMenuItemClick(Sender: TObject);
    procedure DescriptionFilterMenuItemClick(Sender: TObject);
    procedure CustomerFullnameFilterMenuItemClick(Sender: TObject);
    procedure SaleDateFilterMenuItemClick(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure DeleteFunctionClick(Sender: TObject);
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

uses Unit1, Unit3, Unit4, Unit5;

{$R *.dfm}

procedure UpdateStringGridFromFile(path: string);
var facility: FacilityRecord;
begin
  Form2.StringGrid1.RowCount := 1;

  AssignFile(storageFile, path);
  Reset(storageFile);

  for i := 1 to Filesize(storageFile) do
  begin
    read(storageFile, facility);
    AddFacilityToStringGrid(facility);
  end;

  CloseFile(storageFile);
end;

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
  Form3.Caption := 'Добавить объект';
  Form3.ShowModal;
end;

procedure TForm2.AddressFilterMenuItemClick(Sender: TObject);
var
  value: string;
  facilities: array of FacilityRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  value := InputBox('Фильтрация по полю "Адрес"', 'Адрес: ', '');

  if length(value) = 0 then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(facilities, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(facilities) do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    if Trim(AnsiLowerCase(facilities[i].address)) = Trim(AnsiLowerCase(value)) then AddFacilityToStringGrid(facilities[i]);
end;

procedure TForm2.AddressSortAscMenuItemClick(Sender: TObject);
var facilities: array of FacilityRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(facilities, StringGrid1.RowCount - 1);

  for i := 1 to Length(facilities) do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  TArray.Sort<FacilityRecord>(facilities, TDelegatedComparer<FacilityRecord>.Construct(
    function(const Left, Right: FacilityRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.address, right.address);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    AddFacilityToStringGrid(facilities[i]);
end;

procedure TForm2.AddressSortDescMenuItemClick(Sender: TObject);
begin
  AddressSortAscMenuItemClick(AddressSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.CategoryFilterMenuItemClick(Sender: TObject);
var
  facilities: array of FacilityRecord;
  value: string;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  Form4.SecretEdit.Text := '0';
  Form4.ShowModal;
  if Form4.SecretEdit.Text <> '1' then exit;

  value := Form4.CategoryComboBox.Text;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(facilities, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(facilities) do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    if Trim(LowerCase(facilities[i].category)) = Trim(LowerCase(value)) then AddFacilityToStringGrid(facilities[i]);
end;

procedure TForm2.CategorySortAscMenuItemClick(Sender: TObject);
var facilities: array of FacilityRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(facilities, StringGrid1.RowCount - 1);

  for i := 1 to Length(facilities) do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  TArray.Sort<FacilityRecord>(facilities, TDelegatedComparer<FacilityRecord>.Construct(
    function(const Left, Right: FacilityRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.category, right.category);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    AddFacilityToStringGrid(facilities[i]);
end;

procedure TForm2.CategorySortDescMenuItemClick(Sender: TObject);
begin
  CategorySortAscMenuItemClick(CategorySortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.CustomerFullnameFilterMenuItemClick(Sender: TObject);
var
  value: string;
  facilities: array of FacilityRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  value := InputBox('Фильтрация по полю "ФИО покупателя"', 'ФИО покупателя: ', '');

  if length(value) = 0 then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(facilities, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(facilities) do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    if Trim(AnsiLowerCase(facilities[i].customerFullName)) = Trim(AnsiLowerCase(value)) then AddFacilityToStringGrid(facilities[i]);
end;

procedure TForm2.CustomerFullnameSortAscMenuItemClick(Sender: TObject);
var facilities: array of FacilityRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(facilities, StringGrid1.RowCount - 1);

  for i := 1 to Length(facilities) do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  TArray.Sort<FacilityRecord>(facilities, TDelegatedComparer<FacilityRecord>.Construct(
    function(const Left, Right: FacilityRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.customerFullName, right.customerFullName);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    AddFacilityToStringGrid(facilities[i]);
end;

procedure TForm2.CustomerFullnameSortDescMenuItemClick(Sender: TObject);
begin
  CustomerFullnameSortAscMenuItemClick(CustomerFullnameSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.DeleteFunctionClick(Sender: TObject);
var
  facilities: array of FacilityRecord;
  value: string;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  Form4.SecretEdit.Text := '0';
  Form4.ShowModal;
  if Form4.SecretEdit.Text <> '1' then exit;

  value := Form4.CategoryComboBox.Text;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(facilities, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(facilities) do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    if Trim(LowerCase(facilities[i].category)) <> Trim(LowerCase(value)) then AddFacilityToStringGrid(facilities[i]);

  SaveMenuItemClick(SaveMenuItem);
end;

procedure TForm2.DescriptionFilterMenuItemClick(Sender: TObject);
var
  value: string;
  facilities: array of FacilityRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  value := InputBox('Фильтрация по полю "Описание"', 'Описание: ', '');

  if length(value) = 0 then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(facilities, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(facilities) do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    if Trim(AnsiLowerCase(facilities[i].description)) = Trim(AnsiLowerCase(value)) then AddFacilityToStringGrid(facilities[i]);
end;

procedure TForm2.DescriptionSortAscMenuItemClick(Sender: TObject);
var facilities: array of FacilityRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(facilities, StringGrid1.RowCount - 1);

  for i := 1 to Length(facilities) do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  TArray.Sort<FacilityRecord>(facilities, TDelegatedComparer<FacilityRecord>.Construct(
    function(const Left, Right: FacilityRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.description, right.description);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    AddFacilityToStringGrid(facilities[i]);
end;

procedure TForm2.DescriptionSortDescMenuItemClick(Sender: TObject);
begin
  DescriptionSortAscMenuItemClick(DescriptionSortAscMenuItem);
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

procedure TForm2.OwnerFullnameFilterMenuItemClick(Sender: TObject);
var
  value: string;
  facilities: array of FacilityRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  value := InputBox('Фильтрация по полю "ФИО владельца"', 'ФИО владельца: ', '');

  if length(value) = 0 then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(facilities, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(facilities) do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    if Trim(AnsiLowerCase(facilities[i].ownerFullName)) = Trim(AnsiLowerCase(value)) then AddFacilityToStringGrid(facilities[i]);
end;

procedure TForm2.OwnerFullnameSortAscMenuItemClick(Sender: TObject);
var facilities: array of FacilityRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(facilities, StringGrid1.RowCount - 1);

  for i := 1 to Length(facilities) do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  TArray.Sort<FacilityRecord>(facilities, TDelegatedComparer<FacilityRecord>.Construct(
    function(const Left, Right: FacilityRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.ownerFullName, right.ownerFullName);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    AddFacilityToStringGrid(facilities[i]);
end;

procedure TForm2.OwnerFullnameSortDescMenuItemClick(Sender: TObject);
begin
  OwnerFullnameSortAscMenuItemClick(OwnerFullnameSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.PriceFilterMenuItemClick(Sender: TObject);
var
  valueNum1, valueNum2: string;
  facilities: array of FacilityRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  valueNum1 := InputBox('Фильтрация по полю "Стоимость"', 'От: ', '');
  valueNum2 := InputBox('Фильтрация по полю "Стоимость"', 'До: ', '');

  try
    StrToFloat(valueNum1);
    StrToFloat(valueNum2);
  except
    ShowMessage('Введите число!');
    exit;
  end;

  if (length(valueNum1) = 0) or (length(valueNum2) = 0) then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(facilities, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(facilities) do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    if (StrToFloat(facilities[i].price) >= StrToFloat(valueNum1)) and (StrToFloat(facilities[i].price) <= StrToFloat(valueNum2)) then AddFacilityToStringGrid(facilities[i]);
end;

procedure TForm2.PriceSortAscMenuItemClick(Sender: TObject);
var facilities: array of FacilityRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(facilities, StringGrid1.RowCount - 1);

  for i := 1 to Length(facilities) do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  TArray.Sort<FacilityRecord>(facilities, TDelegatedComparer<FacilityRecord>.Construct(
    function(const Left, Right: FacilityRecord): integer
    begin
      Result := TComparer<real>.Default.Compare(StrToFloat(left.price), StrToFloat(right.price));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    AddFacilityToStringGrid(facilities[i]);
end;

procedure TForm2.PriceSortDescMenuItemClick(Sender: TObject);
begin
  PriceSortAscMenuItemClick(PriceSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.SaleDateFilterMenuItemClick(Sender: TObject);
var
  dateStart, dateEnd: integer;
  facilities: array of FacilityRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  DateRangeInputForm.SecretEdit.Text := '0';
  DateRangeInputForm.ShowModal;
  if DateRangeInputForm.SecretEdit.Text <> '1' then exit;

  dateStart := DateTimeToUnix(DateRangeInputForm.DateTimePicker1.Date);
  dateEnd := DateTimeToUnix(DateRangeInputForm.DateTimePicker2.Date);

  UpdateStringGridFromFile(storageFilePath);
  SetLength(facilities, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(facilities) do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    if (DateTimeToUnix(StrToDateTime(facilities[i].saleDate)) >= dateStart) and (DateTimeToUnix(StrToDateTime(facilities[i].saleDate)) <= dateEnd) then AddFacilityToStringGrid(facilities[i]);
end;

procedure TForm2.SaleDateSortAscMenuItemClick(Sender: TObject);
var facilities: array of FacilityRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(facilities, StringGrid1.RowCount - 1);

  for i := 1 to Length(facilities) do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  TArray.Sort<FacilityRecord>(facilities, TDelegatedComparer<FacilityRecord>.Construct(
    function(const Left, Right: FacilityRecord): integer
    begin
      Result := TComparer<integer>.Default.Compare(DateTimeToUnix(StrToDateTime(left.saleDate)), DateTimeToUnix(StrToDateTime(right.saleDate)));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    AddFacilityToStringGrid(facilities[i]);
end;

procedure TForm2.SaleDateSortDescMenuItemClick(Sender: TObject);
begin
  SaleDateSortAscMenuItemClick(SaleDateSortAscMenuItem);
  ReverseStringGrid();
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

procedure TForm2.SearchEditChange(Sender: TObject);
var rect: TRect;
begin
  StringGrid1.Repaint();

  for i := 0 to StringGrid1.ColCount - 1 do
    for j := 1 to StringGrid1.RowCount - 1 do
    begin
      if Pos(AnsiLowerCase(Trim(SearchEdit.Text)), AnsiLowerCase(Trim(StringGrid1.Cells[i, j])))<> 0 then
      begin
        rect := StringGrid1.CellRect(i, j);
        StringGrid1.Canvas.Brush.Color := $C0C0C0;
        StringGrid1.Canvas.FillRect(rect);
        StringGrid1.Canvas.TextOut(rect.Left + 3, rect.Top + 3, StringGrid1.Cells[i, j]);
      end;
    end;
end;

procedure TForm2.StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  activeIndex, buttonSelected: integer;
  facilities: array of FacilityRecord;
begin
  if StringGrid1.Row = 0 then exit;
  activeIndex := StringGrid1.Row;

  SetLength(facilities, StringGrid1.RowCount - 1);

  for i := 1 to StringGrid1.RowCount - 1 do
    facilities[i - 1] := createFacilityFromStringGrid(i);

  buttonSelected := MessageDlg('Вы точно хотите удалить объект (' + facilities[activeIndex - 1].ownerFullName + ')?', mtConfirmation, mbOKCancel, 0);
  if buttonSelected <> mrOk then exit;

  StringGrid1.RowCount := 1;

  for i := 0 to Length(facilities) - 1 do
    if i + 1 <> activeIndex then AddFacilityToStringGrid(facilities[i]);

  if StringGrid1.RowCount <= 1 then StringGrid1.Options := StringGrid1.Options - [goEditing];
  SaveMenuItemClick(SaveMenuItem);
end;

procedure TForm2.StringGrid1DblClick(Sender: TObject);
var facility: FacilityRecord;
begin
  if StringGrid1.Row = 0 then exit;

  facility := createFacilityFromStringGrid(StringGrid1.Row);

  with Form3 do
  begin
    Caption := 'Редактировать объект';
    CategoryComboBox.ItemIndex := CategoryComboBox.Items.IndexOf(facility.category);
    AddressEdit.Text := facility.address;
    OwnerFullNameEdit.Text := facility.ownerFullName;
    PriceEdit.Text := facility.price;
    DescriptionEdit.Text := facility.description;
    CustomerFullNameEdit.Text := facility.customerFullName;
    SaleDateDateTimePicker.Date := StrToDate(facility.saleDate);

    ShowModal;

    facility.category := CategoryComboBox.Text;
    facility.address := AddressEdit.Text;
    facility.ownerFullName := OwnerFullNameEdit.Text;
    facility.price := PriceEdit.Text;
    facility.description := DescriptionEdit.Text;
    facility.customerFullName := CustomerFullNameEdit.Text;
    facility.saleDate := DateToStr(SaleDateDateTimePicker.Date);
  end;

  StringGrid1.Cells[0, StringGrid1.Row] := facility.category;
  StringGrid1.Cells[1, StringGrid1.Row] := facility.address;
  StringGrid1.Cells[2, StringGrid1.Row] := facility.ownerFullName;
  StringGrid1.Cells[3, StringGrid1.Row] := facility.price;
  StringGrid1.Cells[4, StringGrid1.Row] := facility.description;
  StringGrid1.Cells[5, StringGrid1.Row] := facility.customerFullName;
  StringGrid1.Cells[6, StringGrid1.Row] := facility.saleDate;
end;

end.
