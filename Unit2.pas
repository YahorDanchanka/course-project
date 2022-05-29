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
    AddGroupButton: TButton;
    N2: TMenuItem;
    N3: TMenuItem;
    FullnameSortAscMenuItem: TMenuItem;
    FullnameSortDescMenuItem: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SaveAsMenuItemClick(Sender: TObject);
    procedure AddGroupButtonClick(Sender: TObject);
    procedure OpenMenuItemClick(Sender: TObject);
    procedure SaveMenuItemClick(Sender: TObject);
    procedure FullnameSortAscMenuItemClick(Sender: TObject);
    procedure FullnameSortDescMenuItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  groupRecord = record
    fullname, passport, visitsCount, price, ticketType, startedDate, expires: string[20];
  end;
  procedure AddGroupToStringGrid(group: groupRecord);

const fields: array of String = ['���', '�������', '���-�� ���������', '���������', '��� ����������', '���� ������', '���� ��������'];

var
  Form2: TForm2;
  storageFile: file of groupRecord;
  storageFilePath: string;
  i, j: integer;

implementation

uses Unit1, Unit3;

{$R *.dfm}

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

procedure AddGroupToStringGrid(group: groupRecord);
begin
  Form2.StringGrid1.RowCount := Form2.StringGrid1.RowCount + 1;
  Form2.StringGrid1.FixedRows := 1;

  const rowIndex = Form2.StringGrid1.RowCount - 1;

  Form2.StringGrid1.Cells[0, rowIndex] := group.fullname;
  Form2.StringGrid1.Cells[1, rowIndex] := group.passport;
  Form2.StringGrid1.Cells[2, rowIndex] := group.visitsCount;
  Form2.StringGrid1.Cells[3, rowIndex] := group.price;
  Form2.StringGrid1.Cells[4, rowIndex] := group.ticketType;
  Form2.StringGrid1.Cells[5, rowIndex] := group.startedDate;
  Form2.StringGrid1.Cells[6, rowIndex] := group.expires;
end;

function createGroupFromStringGrid(rowIndex: integer): groupRecord;
var group: groupRecord;
begin
  group.fullname := Form2.StringGrid1.Cells[0, rowIndex];
  group.passport := Form2.StringGrid1.Cells[1, rowIndex];
  group.visitsCount := Form2.StringGrid1.Cells[2, rowIndex];
  group.price := Form2.StringGrid1.Cells[3, rowIndex];
  group.ticketType := Form2.StringGrid1.Cells[4, rowIndex];
  group.startedDate := Form2.StringGrid1.Cells[5, rowIndex];
  group.expires := Form2.StringGrid1.Cells[6, rowIndex];
  result := group;
end;

procedure SetStorageFilePath(path: string);
begin
  storageFilePath := path;
  Form2.Caption := '�������� ����� - ' + storageFilePath;
end;

procedure TForm2.AddGroupButtonClick(Sender: TObject);
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

procedure TForm2.FullnameSortAscMenuItemClick(Sender: TObject);
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
      Result := TComparer<string>.Default.Compare(left.fullname, right.fullName);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.FullnameSortDescMenuItemClick(Sender: TObject);
begin
  FullnameSortAscMenuItemClick(FullnameSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.OpenMenuItemClick(Sender: TObject);
var group: groupRecord;
begin
  if OpenDialog1.Execute <> true then exit;

  StringGrid1.RowCount := 1;

  AssignFile(storageFile, OpenDialog1.FileName);
  Reset(storageFile);

  for i := 1 to Filesize(storageFile) do
  begin
    read(storageFile, group);
    AddGroupToStringGrid(group);
  end;

  SetStorageFilePath(OpenDialog1.FileName);
  CloseFile(storageFile);
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
