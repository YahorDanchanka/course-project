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
    N4: TMenuItem;
    PassportSortAscMenuItem: TMenuItem;
    PassportSortDescMenuItem: TMenuItem;
    N5: TMenuItem;
    VisitsCountSortAscMenuItem: TMenuItem;
    VisitsCountSortDescMenuItem: TMenuItem;
    N6: TMenuItem;
    PriceSortAscMenuItem: TMenuItem;
    PriceSortDescMenuItem: TMenuItem;
    N7: TMenuItem;
    TicketTypeSortAscMenuItem: TMenuItem;
    TicketTypeSortDescMenuItem: TMenuItem;
    N8: TMenuItem;
    StartedDateSortAscMenuItem: TMenuItem;
    StartedDateSortDescMenuItem: TMenuItem;
    N9: TMenuItem;
    ExpiresSortAscMenuItem: TMenuItem;
    ExpiresSortDescMenuItem: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SaveAsMenuItemClick(Sender: TObject);
    procedure AddGroupButtonClick(Sender: TObject);
    procedure OpenMenuItemClick(Sender: TObject);
    procedure SaveMenuItemClick(Sender: TObject);
    procedure FullnameSortAscMenuItemClick(Sender: TObject);
    procedure FullnameSortDescMenuItemClick(Sender: TObject);
    procedure PassportSortAscMenuItemClick(Sender: TObject);
    procedure PassportSortDescMenuItemClick(Sender: TObject);
    procedure VisitsCountSortAscMenuItemClick(Sender: TObject);
    procedure VisitsCountSortDescMenuItemClick(Sender: TObject);
    procedure PriceSortAscMenuItemClick(Sender: TObject);
    procedure PriceSortDescMenuItemClick(Sender: TObject);
    procedure TicketTypeSortAscMenuItemClick(Sender: TObject);
    procedure TicketTypeSortDescMenuItemClick(Sender: TObject);
    procedure StartedDateSortAscMenuItemClick(Sender: TObject);
    procedure StartedDateSortDescMenuItemClick(Sender: TObject);
    procedure ExpiresSortAscMenuItemClick(Sender: TObject);
    procedure ExpiresSortDescMenuItemClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
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

uses Unit1, Unit3, Unit4;

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

procedure TForm2.ExpiresSortAscMenuItemClick(Sender: TObject);
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
      Result := TComparer<integer>.Default.Compare(StrToInt(left.expires), StrToInt(right.expires));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.ExpiresSortDescMenuItemClick(Sender: TObject);
begin
  ExpiresSortAscMenuItemClick(ExpiresSortAscMenuItem);
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

procedure TForm2.N11Click(Sender: TObject);
var
  value: string;
  groups: array of groupRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('������ �� �������.');
    exit;
  end;

  value := InputBox('���������� �� ���� "���"', '���:', '');

  if length(value) = 0 then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(groups, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    if AnsiLowerCase(Trim(groups[i].fullName)) = AnsiLowerCase(Trim(value)) then AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.N12Click(Sender: TObject);
var
  value: string;
  groups: array of groupRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('������ �� �������.');
    exit;
  end;

  value := InputBox('���������� �� ���� "�������"', '�������:', '');

  if length(value) = 0 then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(groups, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    if AnsiLowerCase(Trim(groups[i].passport)) = AnsiLowerCase(Trim(value)) then AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.N13Click(Sender: TObject);
var
  valueNum1, valueNum2: string;
  groups: array of groupRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('������ �� �������.');
    exit;
  end;

  valueNum1 := InputBox('���������� �� ���� "���������� ���������"', '�� ', '');
  valueNum2 := InputBox('���������� �� ���� "���������� ���������"', '��: ', '');

  try
    StrToFloat(valueNum1);
    StrToFloat(valueNum2);
  except
    ShowMessage('������� �����!');
    exit;
  end;

  if (length(valueNum1) = 0) or (length(valueNum2) = 0) then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(groups, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    if (StrToFloat(groups[i].visitsCount) >= StrToFloat(valueNum1)) and (StrToFloat(groups[i].visitsCount) <= StrToFloat(valueNum2)) then AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.N14Click(Sender: TObject);
var
  valueNum1, valueNum2: string;
  groups: array of groupRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('������ �� �������.');
    exit;
  end;

  valueNum1 := InputBox('���������� �� ���� "���������"', '�� ', '');
  valueNum2 := InputBox('���������� �� ���� "���������"', '��: ', '');

  try
    StrToFloat(valueNum1);
    StrToFloat(valueNum2);
  except
    ShowMessage('������� �����!');
    exit;
  end;

  if (length(valueNum1) = 0) or (length(valueNum2) = 0) then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(groups, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    if (StrToFloat(groups[i].price) >= StrToFloat(valueNum1)) and (StrToFloat(groups[i].price) <= StrToFloat(valueNum2)) then AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.N15Click(Sender: TObject);
var
  value: string;
  groups: array of groupRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('������ �� �������.');
    exit;
  end;

  value := InputBox('���������� �� ���� "��� ����������"', '��� ����������:', '');

  if length(value) = 0 then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(groups, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    if AnsiLowerCase(Trim(groups[i].ticketType)) = AnsiLowerCase(Trim(value)) then AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.N16Click(Sender: TObject);
var
  dateStart, dateEnd: integer;
  groups: array of groupRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('������ �� �������.');
    exit;
  end;

  DateRangeInputForm.ShowModal;

  dateStart := DateTimeToUnix(DateRangeInputForm.DateTimePicker1.Date);
  dateEnd := DateTimeToUnix(DateRangeInputForm.DateTimePicker2.Date);

  UpdateStringGridFromFile(storageFilePath);
  SetLength(groups, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    if (DateTimeToUnix(StrToDateTime(groups[i].startedDate)) >= dateStart) and (DateTimeToUnix(StrToDateTime(groups[i].startedDate)) <= dateEnd) then AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.N17Click(Sender: TObject);
var
  valueNum1, valueNum2: string;
  groups: array of groupRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('������ �� �������.');
    exit;
  end;

  valueNum1 := InputBox('���������� �� ���� "���� ��������"', '�� ', '');
  valueNum2 := InputBox('���������� �� ���� "���� ��������"', '��: ', '');

  try
    StrToFloat(valueNum1);
    StrToFloat(valueNum2);
  except
    ShowMessage('������� �����!');
    exit;
  end;

  if (length(valueNum1) = 0) or (length(valueNum2) = 0) then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(groups, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    if (StrToFloat(groups[i].expires) >= StrToFloat(valueNum1)) and (StrToFloat(groups[i].expires) <= StrToFloat(valueNum2)) then AddGroupToStringGrid(groups[i]);
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

procedure TForm2.PassportSortAscMenuItemClick(Sender: TObject);
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
      Result := TComparer<string>.Default.Compare(left.passport, right.passport);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.PassportSortDescMenuItemClick(Sender: TObject);
begin
  PassportSortAscMenuItemClick(PassportSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.PriceSortAscMenuItemClick(Sender: TObject);
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
      Result := TComparer<real>.Default.Compare(StrToFloat(left.price), StrToFloat(right.price));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    AddGroupToStringGrid(groups[i]);
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
    var group: groupRecord := createGroupFromStringGrid(i);
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
    var group: groupRecord := createGroupFromStringGrid(i);
    write(storageFile, group);
  end;

  CloseFile(storageFile);
end;

procedure TForm2.StartedDateSortAscMenuItemClick(Sender: TObject);
var groups: array of groupRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(groups, StringGrid1.RowCount - 1);

  for i := 1 to Length(groups) do
    groups[i - 1] := createGroupFromStringGrid(i);

  TArray.Sort<groupRecord>(groups, TDelegatedComparer<groupRecord>.Construct(
    function(const Left, Right: groupRecord): integer
    begin
      Result := TComparer<integer>.Default.Compare(DateTimeToUnix(StrToDateTime(left.startedDate)), DateTimeToUnix(StrToDateTime(right.startedDate)));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.StartedDateSortDescMenuItemClick(Sender: TObject);
begin
  StartedDateSortAscMenuItemClick(StartedDateSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  activeIndex, buttonSelected: integer;
  groups: array of groupRecord;
begin
  if StringGrid1.Row = 0 then exit;
  activeIndex := StringGrid1.Row;

  SetLength(groups, StringGrid1.RowCount - 1);

  for i := 1 to StringGrid1.RowCount - 1 do
    groups[i - 1] := createGroupFromStringGrid(i);

  buttonSelected := MessageDlg('�� ����� ������ ������� ��������� (' + groups[activeIndex - 1].fullname + ')?', mtConfirmation, mbOKCancel, 0);
  if buttonSelected <> mrOk then exit;

  StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    if i + 1 <> activeIndex then AddGroupToStringGrid(groups[i]);

  if StringGrid1.RowCount <= 1 then StringGrid1.Options := StringGrid1.Options - [goEditing];
end;

procedure TForm2.TicketTypeSortAscMenuItemClick(Sender: TObject);
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
      Result := TComparer<string>.Default.Compare(left.ticketType, right.ticketType);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.TicketTypeSortDescMenuItemClick(Sender: TObject);
begin
  TicketTypeSortAscMenuItemClick(TicketTypeSortAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.VisitsCountSortAscMenuItemClick(Sender: TObject);
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
      Result := TComparer<integer>.Default.Compare(StrToInt(left.visitsCount), StrToInt(right.visitsCount));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(groups) - 1 do
    AddGroupToStringGrid(groups[i]);
end;

procedure TForm2.VisitsCountSortDescMenuItemClick(Sender: TObject);
begin
  VisitsCountSortAscMenuItemClick(VisitsCountSortAscMenuItem);
  ReverseStringGrid();
end;

end.
