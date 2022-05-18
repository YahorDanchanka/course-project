unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.StdCtrls, DateUtils,
  System.Generics.Collections, System.Generics.Defaults;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    OpenMenuItem: TMenuItem;
    SaveMenuItem: TMenuItem;
    SaveAsMenuItem: TMenuItem;
    StringGrid1: TStringGrid;
    OpenDialog1: TOpenDialog;
    AddGroupButton: TButton;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    NumberSortAsc: TMenuItem;
    NumberSortDesc: TMenuItem;
    DateSortAsc: TMenuItem;
    DateSortDesc: TMenuItem;
    LevelSortAsc: TMenuItem;
    LevelSortDesc: TMenuItem;
    FullnameSortAsc: TMenuItem;
    FullnameSortDesc: TMenuItem;
    PriceSortAsc: TMenuItem;
    PriceSortDesc: TMenuItem;
    StudentsCountSortAsc: TMenuItem;
    StudentsCountSortDesc: TMenuItem;
    N8: TMenuItem;
    DeleteGroupsButton: TButton;
    N10: TMenuItem;
    IncreasePriceMenuItem: TMenuItem;
    SearchEdit: TEdit;
    SearchLabel: TLabel;
    DumpGroupsInDayMenuItem: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SaveAsMenuItemClick(Sender: TObject);
    procedure AddGroupButtonClick(Sender: TObject);
    procedure OpenMenuItemClick(Sender: TObject);
    procedure SaveMenuItemClick(Sender: TObject);
    procedure NumberSortAscClick(Sender: TObject);
    procedure NumberSortDescClick(Sender: TObject);
    procedure DateSortAscClick(Sender: TObject);
    procedure DateSortDescClick(Sender: TObject);
    procedure LevelSortAscClick(Sender: TObject);
    procedure LevelSortDescClick(Sender: TObject);
    procedure FullnameSortAscClick(Sender: TObject);
    procedure FullnameSortDescClick(Sender: TObject);
    procedure PriceSortAscClick(Sender: TObject);
    procedure PriceSortDescClick(Sender: TObject);
    procedure StudentsCountSortAscClick(Sender: TObject);
    procedure StudentsCountSortDescClick(Sender: TObject);
    procedure DateFilterClick(Sender: TObject);
    procedure DeleteGroupsButtonClick(Sender: TObject);
    procedure IncreasePriceMenuItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure DumpGroupsInDayMenuItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  groupRecord = record
    number, level, fullName, price, day, time, studentsCount: string[20];
  end;
  procedure UpdateStringGridFromFile(path: string);
  function createGroupFromStringGrid(rowIndex: integer): groupRecord;

const fields: array of String = ['Номер группы', 'Уровень', 'ФИО преподавателя', 'Стоимость за занятие', 'День проведения', 'Время проведения', 'Количество учащихся'];
const levels: array of String = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2'];

var
  Form2: TForm2;
  storageFile: file of groupRecord;
  storageFilePath: string;
  i, j: integer;

implementation

uses Unit1, Unit3, Unit4, Unit5;

{$R *.dfm}

function createGroupFromStringGrid(rowIndex: integer): groupRecord;
var group: groupRecord;
begin
  group.number := Form2.StringGrid1.Cells[0, rowIndex];
  group.level := Form2.StringGrid1.Cells[1, rowIndex];
  group.fullName := Form2.StringGrid1.Cells[2, rowIndex];
  group.price := Form2.StringGrid1.Cells[3, rowIndex];
  group.day := Form2.StringGrid1.Cells[4, rowIndex];
  group.time := Form2.StringGrid1.Cells[5, rowIndex];
  group.studentsCount := Form2.StringGrid1.Cells[6, rowIndex];
  result := group;
end;

procedure SetStorageFilePath(path: string);
begin
  storageFilePath := path;
  Form2.Caption := 'Основная форма - ' + storageFilePath;
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

procedure UpdateStringGridFromFile(path: string);
var group: groupRecord;
begin
  Form2.StringGrid1.RowCount := 1;

  AssignFile(storageFile, path);
  Reset(storageFile);

  for i := 1 to Filesize(storageFile) do
  begin
    read(storageFile, group);
    AddGroupToStringGrid(group);
  end;

  CloseFile(storageFile);
end;

procedure TForm2.AddGroupButtonClick(Sender: TObject);
begin
  Form3.ShowModal;
end;

procedure TForm2.DateFilterClick(Sender: TObject);
begin
  Form4.ShowModal;
end;

procedure TForm2.DateSortAscClick(Sender: TObject);
var
  groups: array [1..100] of groupRecord;
  group: groupRecord;
  i_min, min, groupsLength: integer;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  groupsLength := StringGrid1.RowCount - 1;

  for i := 1 to groupsLength do
    groups[i] := createGroupFromStringGrid(i);

  for var i := 1 to groupsLength - 1 do
  begin
    min := DateTimeToUnix(StrToDateTime(groups[i].day + ' ' + groups[i].time)); i_min := i;

    for var j := i + 1 to groupsLength do
      if DateTimeToUnix(StrToDateTime(groups[j].day + ' ' + groups[j].time)) < min then
      begin
        min := DateTimeToUnix(StrToDateTime(groups[j].day + ' ' + groups[j].time));
        i_min := j;
      end;

    group := groups[i_min];
    groups[i_min] := groups[i];
    groups[i] := group;
  end;

  StringGrid1.RowCount := 1;

  for i := 1 to groupsLength do
    AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.DateSortDescClick(Sender: TObject);
begin
  DateSortAscClick(DateSortAsc);
  ReverseStringGrid();
end;

procedure TForm2.DeleteGroupsButtonClick(Sender: TObject);
var
  groups: array of groupRecord;
  group: groupRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(groups, StringGrid1.RowCount - 1);

  // Skip first row
  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    if StrToInt(groups[i].studentsCount) >= 10 then AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.DumpGroupsInDayMenuItemClick(Sender: TObject);
begin
  Form4.ShowModal;
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

procedure TForm2.FormCreate(Sender: TObject);
begin
  Form2.Color:=	$C0C0C0;
end;

procedure TForm2.FullnameSortAscClick(Sender: TObject);
var
  groups: array of groupRecord;
  group: groupRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(groups, StringGrid1.RowCount - 1);

  // Skip first row
  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  TArray.Sort<groupRecord>(groups, TDelegatedComparer<groupRecord>.Construct(
    function(const Left, Right: groupRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.fullName, right.fullName);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.FullnameSortDescClick(Sender: TObject);
begin
  FullnameSortAscClick(FullnameSortAsc);
  ReverseStringGrid();
end;

procedure TForm2.IncreasePriceMenuItemClick(Sender: TObject);
begin
  Form5.ShowModal;
end;

procedure TForm2.LevelSortAscClick(Sender: TObject);
var
  groups: array of groupRecord;
  group: groupRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(groups, StringGrid1.RowCount - 1);

  // Skip first row
  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  TArray.Sort<groupRecord>(groups, TDelegatedComparer<groupRecord>.Construct(
    function(const Left, Right: groupRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.level, right.level);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.LevelSortDescClick(Sender: TObject);
begin
  LevelSortAscClick(LevelSortAsc);
  ReverseStringGrid();
end;

procedure TForm2.NumberSortAscClick(Sender: TObject);
var
  groups: array of groupRecord;
  group: groupRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(groups, StringGrid1.RowCount - 1);

  // Skip first row
  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  TArray.Sort<groupRecord>(groups, TDelegatedComparer<groupRecord>.Construct(
    function(const Left, Right: groupRecord): integer
    begin
      Result := TComparer<integer>.Default.Compare(StrToInt(left.number), StrToInt(right.number));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.NumberSortDescClick(Sender: TObject);
begin
  NumberSortAscClick(NumberSortAsc);
  ReverseStringGrid();
end;

procedure TForm2.OpenMenuItemClick(Sender: TObject);
begin
  if OpenDialog1.Execute <> true then exit;

  UpdateStringGridFromFile(OpenDialog1.FileName);
  SetStorageFilePath(OpenDialog1.FileName);
end;

procedure TForm2.PriceSortAscClick(Sender: TObject);
var
  groups: array of groupRecord;
  group: groupRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(groups, StringGrid1.RowCount - 1);

  // Skip first row
  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  TArray.Sort<groupRecord>(groups, TDelegatedComparer<groupRecord>.Construct(
    function(const Left, Right: groupRecord): integer
    begin
      Result := TComparer<integer>.Default.Compare(StrToInt(left.price), StrToInt(right.price));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.PriceSortDescClick(Sender: TObject);
begin
  PriceSortAscClick(PriceSortAsc);
  ReverseStringGrid();
end;

procedure TForm2.SaveAsMenuItemClick(Sender: TObject);
begin
  if OpenDialog1.Execute <> true then exit;

  AssignFile(storageFile, OpenDialog1.FileName);
  Rewrite(storageFile);

  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    var group: groupRecord := createGroupFromStringGrid(i);
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
    var group: groupRecord := createGroupFromStringGrid(i);
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
  activeIndex: integer;
  students: array of groupRecord;
begin
  if StringGrid1.Row = 0 then exit;
  activeIndex := StringGrid1.Row;

  SetLength(students, StringGrid1.RowCount - 1);

  for i := 1 to StringGrid1.RowCount - 1 do
    students[i - 1] := createGroupFromStringGrid(i);

  StringGrid1.RowCount := 1;

  for i := 0 to Length(students) - 1 do
    if i + 1 <> activeIndex then AddGroupToStringGrid(students[i]);

  if StringGrid1.RowCount <= 1 then StringGrid1.Options := StringGrid1.Options - [goEditing];
end;

procedure TForm2.StudentsCountSortAscClick(Sender: TObject);
var
  groups: array of groupRecord;
  group: groupRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(groups, StringGrid1.RowCount - 1);

  // Skip first row
  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  TArray.Sort<groupRecord>(groups, TDelegatedComparer<groupRecord>.Construct(
    function(const Left, Right: groupRecord): integer
    begin
      Result := TComparer<integer>.Default.Compare(StrToInt(left.studentsCount), StrToInt(right.studentsCount));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.StudentsCountSortDescClick(Sender: TObject);
begin
  StudentsCountSortAscClick(StudentsCountSortAsc);
  ReverseStringGrid();
end;

end.
