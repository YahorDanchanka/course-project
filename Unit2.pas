unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.StdCtrls, DateUtils;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  groupRecord = record
    number, level, fullName, price, day, time, studentsCount: string[20];
  end;

const fields: array of String = ['Номер группы', 'Уровень', 'ФИО преподавателя', 'Стоимость за занятие', 'День проведения', 'Время проведения', 'Количество учащихся'];

var
  Form2: TForm2;
  storageFile: file of groupRecord;
  storageFilePath: string;
  i, j: integer;

implementation

uses Unit1, Unit3;

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

procedure TForm2.NumberSortAscClick(Sender: TObject);
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
    min := StrToInt(groups[i].number); i_min := i;

    for var j := i + 1 to groupsLength do
      if StrToInt(groups[j].number) < min then
      begin
        min := StrToInt(groups[j].number);
        i_min := j;
      end;

    group := groups[i_min];
    groups[i_min] := groups[i];
    groups[i] := group;
  end;

  StringGrid1.RowCount := 1;

  for i := 1 to groupsLength do
  begin
    AddGroupToStringGrid(groups[i]);
  end;
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

end.
