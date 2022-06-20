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
    AddPerfomanceButton: TButton;
    SaveDialog1: TSaveDialog;
    N2: TMenuItem;
    N3: TMenuItem;
    TitleSortAscMenuItem: TMenuItem;
    TitleSortDescMenuItem: TMenuItem;
    N4: TMenuItem;
    DurationSortAscMenuItem: TMenuItem;
    DurationSortDescMenuItem: TMenuItem;
    N5: TMenuItem;
    AgeLimitSortAscMenuItem: TMenuItem;
    AgeLimitSortDescMenuItem: TMenuItem;
    N6: TMenuItem;
    CategorySortAscMenuItem: TMenuItem;
    CategorySortDescMenuItem: TMenuItem;
    N7: TMenuItem;
    PriceSortAscMenuItem: TMenuItem;
    PriceSortDescMenuItem: TMenuItem;
    N8: TMenuItem;
    PremiereDateSortAscMenuItem: TMenuItem;
    PremiereDateSortDescMenuItem: TMenuItem;
    N9: TMenuItem;
    DaysSortAscMenuItem: TMenuItem;
    DaysSortDescMenuItem: TMenuItem;
    N10: TMenuItem;
    TitleFilterMenuItem: TMenuItem;
    DurationFilterMenuItem: TMenuItem;
    AgeLimitFilterMenuItem: TMenuItem;
    CategoryFilterMenuItem: TMenuItem;
    PriceFilterMenuItem: TMenuItem;
    PremiereDateFilterMenuItem: TMenuItem;
    DaysFilterMenuItem: TMenuItem;
    N11: TMenuItem;
    DeletePerformancesFunction: TMenuItem;
    IncreasePerformancesFunction: TMenuItem;
    DumpPerformancesFunction: TMenuItem;
    ClearStringGrid: TMenuItem;
    SearchEdit: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SaveAsMenuItemClick(Sender: TObject);
    procedure OpenMenuItemClick(Sender: TObject);
    procedure SaveMenuItemClick(Sender: TObject);
    procedure AddPerfomanceButtonClick(Sender: TObject);
    procedure StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TitleSortAscMenuItemClick(Sender: TObject);
    procedure TitleSortDescMenuItemClick(Sender: TObject);
    procedure DurationSortAscMenuItemClick(Sender: TObject);
    procedure DurationSortDescMenuItemClick(Sender: TObject);
    procedure AgeLimitSortAscMenuItemClick(Sender: TObject);
    procedure AgeLimitSortDescMenuItemClick(Sender: TObject);
    procedure CategorySortAscMenuItemClick(Sender: TObject);
    procedure CategorySortDescMenuItemClick(Sender: TObject);
    procedure PriceSortAscMenuItemClick(Sender: TObject);
    procedure PriceSortDescMenuItemClick(Sender: TObject);
    procedure PremiereDateSortAscMenuItemClick(Sender: TObject);
    procedure PremiereDateSortDescMenuItemClick(Sender: TObject);
    procedure DaysSortDescMenuItemClick(Sender: TObject);
    procedure DaysSortAscMenuItemClick(Sender: TObject);
    procedure TitleFilterMenuItemClick(Sender: TObject);
    procedure DurationFilterMenuItemClick(Sender: TObject);
    procedure AgeLimitFilterMenuItemClick(Sender: TObject);
    procedure CategoryFilterMenuItemClick(Sender: TObject);
    procedure PriceFilterMenuItemClick(Sender: TObject);
    procedure PremiereDateFilterMenuItemClick(Sender: TObject);
    procedure DaysFilterMenuItemClick(Sender: TObject);
    procedure DeletePerformancesFunctionClick(Sender: TObject);
    procedure IncreasePerformancesFunctionClick(Sender: TObject);
    procedure DumpPerformancesFunctionClick(Sender: TObject);
    procedure ClearStringGridClick(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  PerformanceRecord = record
    title, duration, ageLimit, category, price, premiereDate, days: string[30];
  end;
  procedure AddPerformanceToStringGrid(perfomance: PerformanceRecord);

var
  Form2: TForm2;
  storageFile: file of PerformanceRecord;
  storageFilePath: string;
  i, j: integer;

implementation

uses Unit1, Unit3, Unit4, Unit5, Unit6;

{$R *.dfm}

procedure UpdateStringGridFromFile(path: string);
var group: PerformanceRecord;
begin
  Form2.StringGrid1.RowCount := 1;

  AssignFile(storageFile, path);
  Reset(storageFile);

  for i := 1 to Filesize(storageFile) do
  begin
    read(storageFile, group);
    AddPerformanceToStringGrid(group);
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

procedure AddPerformanceToStringGrid(perfomance: PerformanceRecord);
begin
  Form2.StringGrid1.RowCount := Form2.StringGrid1.RowCount + 1;
  Form2.StringGrid1.FixedRows := 1;
  Form2.StringGrid1.Options := Form2.StringGrid1.Options + [goEditing];

  const rowIndex = Form2.StringGrid1.RowCount - 1;

  Form2.StringGrid1.Cells[0, rowIndex] := perfomance.title;
  Form2.StringGrid1.Cells[1, rowIndex] := perfomance.duration;
  Form2.StringGrid1.Cells[2, rowIndex] := perfomance.ageLimit;
  Form2.StringGrid1.Cells[3, rowIndex] := perfomance.category;
  Form2.StringGrid1.Cells[4, rowIndex] := perfomance.price;
  Form2.StringGrid1.Cells[5, rowIndex] := perfomance.premiereDate;
  Form2.StringGrid1.Cells[6, rowIndex] := perfomance.days;
end;

function createPerformanceFromStringGrid(rowIndex: integer): PerformanceRecord;
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
  Form3.TitleEdit.Text := '';
  Form3.DurationEdit.Text := '';
  Form3.AgeLimitEdit.Text := '';
  Form3.PriceEdit.Text := '';
  Form3.ShowModal;
end;

procedure TForm2.AgeLimitFilterMenuItemClick(Sender: TObject);
var
  valueNum1, valueNum2: string;
  performances: array of PerformanceRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  valueNum1 := InputBox('Фильтрация по полю "Возрастное ограничение"', 'От: ', '');
  valueNum2 := InputBox('Фильтрация по полю "Возрастное ограничение"', 'До: ', '');

  try
    StrToFloat(valueNum1);
    StrToFloat(valueNum2);
  except
    ShowMessage('Введите число!');
    exit;
  end;

  if (length(valueNum1) = 0) or (length(valueNum2) = 0) then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(performances, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
    if (StrToFloat(performances[i].ageLimit) >= StrToFloat(valueNum1)) and (StrToFloat(performances[i].ageLimit) <= StrToFloat(valueNum2)) then AddPerformanceToStringGrid(performances[i]);
end;

procedure TForm2.AgeLimitSortAscMenuItemClick(Sender: TObject);
var performances: array of PerformanceRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(performances, StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  TArray.Sort<PerformanceRecord>(performances, TDelegatedComparer<PerformanceRecord>.Construct(
    function(const Left, Right: PerformanceRecord): integer
    begin
      Result := TComparer<real>.Default.Compare(StrToFloat(left.ageLimit), StrToFloat(right.ageLimit));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
    AddPerformanceToStringGrid(performances[i]);
end;

procedure TForm2.AgeLimitSortDescMenuItemClick(Sender: TObject);
begin
  AgeLimitSortAscMenuItemClick(AgeLimitSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.CategoryFilterMenuItemClick(Sender: TObject);
var
  performances: array of PerformanceRecord;
  value: string;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  Form4.ShowModal;

  value := Form4.CategoryComboBox.Text;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(performances, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
    if Trim(LowerCase(performances[i].category)) = Trim(LowerCase(value)) then AddPerformanceToStringGrid(performances[i]);
end;

procedure TForm2.CategorySortAscMenuItemClick(Sender: TObject);
var
  performances: array of PerformanceRecord;
  group: PerformanceRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(performances, StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  TArray.Sort<PerformanceRecord>(performances, TDelegatedComparer<PerformanceRecord>.Construct(
    function(const Left, Right: PerformanceRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.category, right.category);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
    AddPerformanceToStringGrid(performances[i]);
end;

procedure TForm2.CategorySortDescMenuItemClick(Sender: TObject);
begin
  CategorySortAscMenuItemClick(CategorySortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.ClearStringGridClick(Sender: TObject);
begin
  StringGrid1.RowCount := 1;
  Form2.StringGrid1.Options := Form2.StringGrid1.Options - [goEditing];
end;

procedure TForm2.DaysFilterMenuItemClick(Sender: TObject);
var performances: array of PerformanceRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  Form6.ShowModal;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(performances, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
    for j := 0 to Form6.DaysListBox.Items.Count - 1 do
    begin
      if (Form6.DaysListBox.Selected[j]) and (Pos(Form6.DaysListBox.Items.Strings[j], performances[i].days) <> 0)
        then AddPerformanceToStringGrid(performances[i]);
    end;
end;

procedure TForm2.DaysSortAscMenuItemClick(Sender: TObject);
var
  performances: array of PerformanceRecord;
  group: PerformanceRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(performances, StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  TArray.Sort<PerformanceRecord>(performances, TDelegatedComparer<PerformanceRecord>.Construct(
    function(const Left, Right: PerformanceRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.days, right.days);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
    AddPerformanceToStringGrid(performances[i]);
end;

procedure TForm2.DaysSortDescMenuItemClick(Sender: TObject);
begin
  DaysSortAscMenuItemClick(DaysSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.DeletePerformancesFunctionClick(Sender: TObject);
var
  performances: array of PerformanceRecord;
  monthNumber, currentMonthNumber: integer;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(performances, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
  begin
    monthNumber := MonthOf(StrToDate(performances[i].premiereDate));
    currentMonthNumber := MonthOf(now);
    if (CurrentYear = YearOf(StrToDate(performances[i].premiereDate))) and (currentMonthNumber - monthNumber <= 3) then AddPerformanceToStringGrid(performances[i]);
  end;
end;

procedure TForm2.DumpPerformancesFunctionClick(Sender: TObject);
var performances: array of PerformanceRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(performances, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
    if Pos('сб', AnsiLowerCase(performances[i].days)) <> 0 then AddPerformanceToStringGrid(performances[i]);
end;

procedure TForm2.DurationFilterMenuItemClick(Sender: TObject);
var
  valueNum1, valueNum2: string;
  performances: array of PerformanceRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  valueNum1 := InputBox('Фильтрация по полю "Длительность"', 'От: ', '');
  valueNum2 := InputBox('Фильтрация по полю "Длительность"', 'До: ', '');

  try
    StrToFloat(valueNum1);
    StrToFloat(valueNum2);
  except
    ShowMessage('Введите число!');
    exit;
  end;

  if (length(valueNum1) = 0) or (length(valueNum2) = 0) then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(performances, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
    if (StrToFloat(performances[i].duration) >= StrToFloat(valueNum1)) and (StrToFloat(performances[i].duration) <= StrToFloat(valueNum2)) then AddPerformanceToStringGrid(performances[i]);
end;

procedure TForm2.DurationSortAscMenuItemClick(Sender: TObject);
var performances: array of PerformanceRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(performances, StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  TArray.Sort<PerformanceRecord>(performances, TDelegatedComparer<PerformanceRecord>.Construct(
    function(const Left, Right: PerformanceRecord): integer
    begin
      Result := TComparer<real>.Default.Compare(StrToFloat(left.duration), StrToFloat(right.duration));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
    AddPerformanceToStringGrid(performances[i]);
end;

procedure TForm2.DurationSortDescMenuItemClick(Sender: TObject);
begin
  DurationSortAscMenuItemClick(DurationSortAscMenuItem);
  ReverseStringGrid();
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

procedure TForm2.IncreasePerformancesFunctionClick(Sender: TObject);
var
  performances: array of PerformanceRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(performances, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
  begin
    if performances[i].ageLimit = '16' then
      performances[i].price := FloatToStr(StrToFloat(performances[i].price) + StrToFloat(performances[i].price) * 10 / 100);

    AddPerformanceToStringGrid(performances[i]);
  end;

  SaveMenuItemClick(SaveMenuItem);
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
    AddPerformanceToStringGrid(group);
  end;

  SetStorageFilePath(OpenDialog1.FileName);
  CloseFile(storageFile);
end;

procedure TForm2.PremiereDateFilterMenuItemClick(Sender: TObject);
var
  dateStart, dateEnd: integer;
  performances: array of PerformanceRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  DateRangeInputForm.ShowModal;

  dateStart := DateTimeToUnix(DateRangeInputForm.DateTimePicker1.Date);
  dateEnd := DateTimeToUnix(DateRangeInputForm.DateTimePicker2.Date);

  UpdateStringGridFromFile(storageFilePath);
  SetLength(performances, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
    if (DateTimeToUnix(StrToDateTime(performances[i].premiereDate)) >= dateStart) and (DateTimeToUnix(StrToDateTime(performances[i].premiereDate)) <= dateEnd) then AddPerformanceToStringGrid(performances[i]);
end;

procedure TForm2.PremiereDateSortAscMenuItemClick(Sender: TObject);
var sales: array of PerformanceRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(sales, StringGrid1.RowCount - 1);

  for i := 1 to Length(sales) do
    sales[i - 1] := createPerformanceFromStringGrid(i);

  TArray.Sort<PerformanceRecord>(sales, TDelegatedComparer<PerformanceRecord>.Construct(
    function(const Left, Right: PerformanceRecord): integer
    begin
      Result := TComparer<integer>.Default.Compare(DateTimeToUnix(StrToDateTime(left.premiereDate)), DateTimeToUnix(StrToDateTime(right.premiereDate)));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(sales) - 1 do
    AddPerformanceToStringGrid(sales[i]);
end;

procedure TForm2.PremiereDateSortDescMenuItemClick(Sender: TObject);
begin
  PremiereDateSortAscMenuItemClick(PremiereDateSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.PriceFilterMenuItemClick(Sender: TObject);
var
  valueNum1, valueNum2: string;
  performances: array of PerformanceRecord;
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
  SetLength(performances, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
    if (StrToFloat(performances[i].price) >= StrToFloat(valueNum1)) and (StrToFloat(performances[i].price) <= StrToFloat(valueNum2)) then AddPerformanceToStringGrid(performances[i]);
end;

procedure TForm2.PriceSortAscMenuItemClick(Sender: TObject);
var performances: array of PerformanceRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(performances, StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  TArray.Sort<PerformanceRecord>(performances, TDelegatedComparer<PerformanceRecord>.Construct(
    function(const Left, Right: PerformanceRecord): integer
    begin
      Result := TComparer<real>.Default.Compare(StrToFloat(left.price), StrToFloat(right.price));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
    AddPerformanceToStringGrid(performances[i]);
end;

procedure TForm2.PriceSortDescMenuItemClick(Sender: TObject);
begin
  PriceSortAscMenuItemClick(PriceSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.SaveAsMenuItemClick(Sender: TObject);
begin
  if SaveDialog1.Execute <> true then exit;

  AssignFile(storageFile, SaveDialog1.FileName);
  Rewrite(storageFile);

  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    var group: PerformanceRecord := createPerformanceFromStringGrid(i);
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
    var group: PerformanceRecord := createPerformanceFromStringGrid(i);
    write(storageFile, group);
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
  performances: array of PerformanceRecord;
begin
  if StringGrid1.Row = 0 then exit;
  activeIndex := StringGrid1.Row;

  SetLength(performances, StringGrid1.RowCount - 1);

  for i := 1 to StringGrid1.RowCount - 1 do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  buttonSelected := MessageDlg('Вы точно хотите удалить выступление (' + performances[activeIndex - 1].title + ')?', mtConfirmation, mbOKCancel, 0);
  if buttonSelected <> mrOk then exit;

  StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
    if i + 1 <> activeIndex then AddPerformanceToStringGrid(performances[i]);

  if StringGrid1.RowCount <= 1 then StringGrid1.Options := StringGrid1.Options - [goEditing];
end;

procedure TForm2.TitleFilterMenuItemClick(Sender: TObject);
var
  value: string;
  performances: array of PerformanceRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  value := InputBox('Фильтрация по полю "Название спектакля"', 'Название спектакля: ', '');

  if length(value) = 0 then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(performances, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
    if Trim(LowerCase(performances[i].title)) = Trim(LowerCase(value)) then AddPerformanceToStringGrid(performances[i]);
end;

procedure TForm2.TitleSortAscMenuItemClick(Sender: TObject);
var
  performances: array of PerformanceRecord;
  group: PerformanceRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(performances, StringGrid1.RowCount - 1);

  for i := 1 to Length(performances) do
    performances[i - 1] := createPerformanceFromStringGrid(i);

  TArray.Sort<PerformanceRecord>(performances, TDelegatedComparer<PerformanceRecord>.Construct(
    function(const Left, Right: PerformanceRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.title, right.title);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(performances) - 1 do
    AddPerformanceToStringGrid(performances[i]);
end;

procedure TForm2.TitleSortDescMenuItemClick(Sender: TObject);
begin
  TitleSortAscMenuItemClick(TitleSortAscMenuItem);
  ReverseStringGrid();
end;

end.
