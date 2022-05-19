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
    FullnameAscMenuItem: TMenuItem;
    FullnameDescMenuItem: TMenuItem;
    N4: TMenuItem;
    BirthdayAscMenuItem: TMenuItem;
    BirthdayDescMenuItem: TMenuItem;
    N5: TMenuItem;
    AddressAscMenuItem: TMenuItem;
    AddressDescMenuItem: TMenuItem;
    N6: TMenuItem;
    SpecialtyAscMenuItem: TMenuItem;
    SpecialtyDescMenuItem: TMenuItem;
    N7: TMenuItem;
    GroupNumberDescMenuItem: TMenuItem;
    GroupNumberAscMenuItem: TMenuItem;
    N8: TMenuItem;
    ReceiptDateAscMenuItem: TMenuItem;
    ReceiptDateDescMenuItem: TMenuItem;
    N9: TMenuItem;
    DeleteRecordsByGroupNumberMenuItem: TMenuItem;
    IncreaseCourseMenuItem: TMenuItem;
    Label1: TLabel;
    SearchEdit: TEdit;
    DumpCurrentYearStudentsMenuItem: TMenuItem;
    N10: TMenuItem;
    FullnameFilterMenuItem: TMenuItem;
    BirthdayFilterMenuItem: TMenuItem;
    AddressFilterMenuItem: TMenuItem;
    SpecialtyFIlterMenuItem: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SaveAsMenuItemClick(Sender: TObject);
    procedure AddGroupButtonClick(Sender: TObject);
    procedure OpenMenuItemClick(Sender: TObject);
    procedure SaveMenuItemClick(Sender: TObject);
    procedure FullnameAscMenuItemClick(Sender: TObject);
    procedure FullnameDescMenuItemClick(Sender: TObject);
    procedure BirthdayAscMenuItemClick(Sender: TObject);
    procedure BirthdayDescMenuItemClick(Sender: TObject);
    procedure AddressAscMenuItemClick(Sender: TObject);
    procedure AddressDescMenuItemClick(Sender: TObject);
    procedure SpecialtyAscMenuItemClick(Sender: TObject);
    procedure SpecialtyDescMenuItemClick(Sender: TObject);
    procedure GroupNumberAscMenuItemClick(Sender: TObject);
    procedure GroupNumberDescMenuItemClick(Sender: TObject);
    procedure ReceiptDateAscMenuItemClick(Sender: TObject);
    procedure ReceiptDateDescMenuItemClick(Sender: TObject);
    procedure StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure DeleteRecordsByGroupNumberMenuItemClick(Sender: TObject);
    procedure IncreaseCourseMenuItemClick(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure DumpCurrentYearStudentsMenuItemClick(Sender: TObject);
    procedure FullnameFilterMenuItemClick(Sender: TObject);
    procedure BirthdayFilterMenuItemClick(Sender: TObject);
    procedure AddressFilterMenuItemClick(Sender: TObject);
    procedure SpecialtyFIlterMenuItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  studentRecord = record
    fullname, birthday, phone, address, specialty, groupNumber, receiptDate: string[20];
  end;
  procedure AddStudentToStringGrid(student: studentRecord);
  function createStudentFromStringGrid(rowIndex: integer): studentRecord;

const fields: array of String = [
  'ФИО учащегося',
  'Дата рождения',
  'Телефон',
  'Адрес',
  'Специальность',
  'Номер группы',
  'Дата поступления'
];

var
  Form2: TForm2;
  storageFile: file of studentRecord;
  storageFilePath: string;
  i, j: integer;

implementation

uses Unit1, Unit3, Unit4, Unit5;

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
var student: studentRecord;
begin
  Form2.StringGrid1.RowCount := 1;

  AssignFile(storageFile, path);
  Reset(storageFile);

  for i := 1 to Filesize(storageFile) do
  begin
    read(storageFile, student);
    AddStudentToStringGrid(student);
  end;

  CloseFile(storageFile);
end;

procedure AddStudentToStringGrid(student: studentRecord);
begin
  Form2.StringGrid1.RowCount := Form2.StringGrid1.RowCount + 1;
  Form2.StringGrid1.FixedRows := 1;
  Form2.StringGrid1.Options := Form2.StringGrid1.Options + [goEditing];

  const rowIndex = Form2.StringGrid1.RowCount - 1;

  Form2.StringGrid1.Cells[0, rowIndex] := student.fullname;
  Form2.StringGrid1.Cells[1, rowIndex] := student.birthday;
  Form2.StringGrid1.Cells[2, rowIndex] := student.phone;
  Form2.StringGrid1.Cells[3, rowIndex] := student.address;
  Form2.StringGrid1.Cells[4, rowIndex] := student.specialty;
  Form2.StringGrid1.Cells[5, rowIndex] := student.groupNumber;
  Form2.StringGrid1.Cells[6, rowIndex] := student.receiptDate;
end;

function createStudentFromStringGrid(rowIndex: integer): studentRecord;
var student: studentRecord;
begin
  student.fullname := Form2.StringGrid1.Cells[0, rowIndex];
  student.birthday := Form2.StringGrid1.Cells[1, rowIndex];
  student.phone := Form2.StringGrid1.Cells[2, rowIndex];
  student.address := Form2.StringGrid1.Cells[3, rowIndex];
  student.specialty := Form2.StringGrid1.Cells[4, rowIndex];
  student.groupNumber := Form2.StringGrid1.Cells[5, rowIndex];
  student.receiptDate := Form2.StringGrid1.Cells[6, rowIndex];
  result := student;
end;

procedure SetStorageFilePath(path: string);
begin
  storageFilePath := path;
  Form2.Caption := 'Основная форма - ' + storageFilePath;
end;

procedure TForm2.AddGroupButtonClick(Sender: TObject);
begin
  Form3.ShowModal;
end;

procedure TForm2.AddressAscMenuItemClick(Sender: TObject);
var students: array of studentRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(students, StringGrid1.RowCount - 1);

  for i := 1 to Length(students) do
    students[i - 1] := createStudentFromStringGrid(i);

  TArray.Sort<studentRecord>(students, TDelegatedComparer<studentRecord>.Construct(
    function(const Left, Right: studentRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.address, right.address);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(students) - 1 do
    AddStudentToStringGrid(students[i]);
end;

procedure TForm2.AddressDescMenuItemClick(Sender: TObject);
begin
  AddressAscMenuItemClick(AddressDescMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.AddressFilterMenuItemClick(Sender: TObject);
var
  value: string;
  students: array of studentRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  value := InputBox('Фильтрация по полю "Адрес"', 'Адрес:', '');

  if length(value) = 0 then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(students, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(students) do
    students[i - 1] := createStudentFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(students) - 1 do
    if AnsiLowerCase(Trim(students[i].address)) = AnsiLowerCase(Trim(value)) then AddStudentToStringGrid(students[i]);
end;

procedure TForm2.BirthdayAscMenuItemClick(Sender: TObject);
var students: array of studentRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(students, StringGrid1.RowCount - 1);

  for i := 1 to Length(students) do
    students[i - 1] := createStudentFromStringGrid(i);

  TArray.Sort<studentRecord>(students, TDelegatedComparer<studentRecord>.Construct(
    function(const Left, Right: studentRecord): integer
    begin
      Result := TComparer<integer>.Default.Compare(DateTimeToUnix(StrToDateTime(left.birthday)), DateTimeToUnix(StrToDateTime(right.birthday)));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(students) - 1 do
    AddStudentToStringGrid(students[i]);
end;

procedure TForm2.BirthdayDescMenuItemClick(Sender: TObject);
begin
  BirthdayAscMenuItemClick(BirthdayAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.BirthdayFilterMenuItemClick(Sender: TObject);
var
  dateStart, dateEnd: integer;
  students: array of studentRecord;
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
  SetLength(students, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(students) do
    students[i - 1] := createStudentFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(students) - 1 do
    if (DateTimeToUnix(StrToDateTime(students[i].birthday)) >= dateStart) and (DateTimeToUnix(StrToDateTime(students[i].birthday)) <= dateEnd) then AddStudentToStringGrid(students[i]);
end;

procedure TForm2.DeleteRecordsByGroupNumberMenuItemClick(Sender: TObject);
var
  students: array of studentRecord;
  groupNumber: integer;
begin
  groupNumber := StrToInt(InputBox('Удалить записи определенной группы', 'Номер группы', ''));

  SetLength(students, StringGrid1.RowCount - 1);

  for i := 1 to StringGrid1.RowCount - 1 do
    students[i - 1] := createStudentFromStringGrid(i);

  StringGrid1.RowCount := 1;

  for i := 0 to Length(students) - 1 do
    if StrToInt(students[i].groupNumber) <> groupNumber then AddStudentToStringGrid(students[i]);

  if StringGrid1.RowCount <= 1 then StringGrid1.Options := StringGrid1.Options - [goEditing];
end;

procedure TForm2.DumpCurrentYearStudentsMenuItemClick(Sender: TObject);
var students: array of studentRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(students, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(students) do
    students[i - 1] := createStudentFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(students) - 1 do
    if YearOf(StrToDateTime(students[i].receiptDate)) = CurrentYear then AddStudentToStringGrid(students[i]);
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

procedure TForm2.FullnameAscMenuItemClick(Sender: TObject);
var students: array of studentRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(students, StringGrid1.RowCount - 1);

  for i := 1 to Length(students) do
    students[i - 1] := createStudentFromStringGrid(i);

  TArray.Sort<studentRecord>(students, TDelegatedComparer<studentRecord>.Construct(
    function(const Left, Right: studentRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.fullname, right.fullname);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(students) - 1 do
    AddStudentToStringGrid(students[i]);
end;

procedure TForm2.FullnameDescMenuItemClick(Sender: TObject);
begin
  FullnameAscMenuItemClick(FullnameAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.FullnameFilterMenuItemClick(Sender: TObject);
var
  value: string;
  students: array of studentRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  value := InputBox('Фильтрация по полю "ФИО учащегося"', 'ФИО учащегося:', '');

  if length(value) = 0 then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(students, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(students) do
    students[i - 1] := createStudentFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(students) - 1 do
    if AnsiLowerCase(Trim(students[i].fullname)) = AnsiLowerCase(Trim(value)) then AddStudentToStringGrid(students[i]);
end;

procedure TForm2.GroupNumberAscMenuItemClick(Sender: TObject);
var students: array of studentRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(students, StringGrid1.RowCount - 1);

  for i := 1 to Length(students) do
    students[i - 1] := createStudentFromStringGrid(i);

  TArray.Sort<studentRecord>(students, TDelegatedComparer<studentRecord>.Construct(
    function(const Left, Right: studentRecord): integer
    begin
      Result := TComparer<integer>.Default.Compare(StrToInt(left.groupNumber), StrToInt(right.groupNumber));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(students) - 1 do
    AddStudentToStringGrid(students[i]);
end;

procedure TForm2.GroupNumberDescMenuItemClick(Sender: TObject);
begin
  GroupNumberAscMenuItemClick(GroupNumberDescMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.IncreaseCourseMenuItemClick(Sender: TObject);
begin
  Form4.ShowModal;
end;

procedure TForm2.OpenMenuItemClick(Sender: TObject);
var student: studentRecord;
begin
  if OpenDialog1.Execute <> true then exit;

  StringGrid1.RowCount := 1;

  AssignFile(storageFile, OpenDialog1.FileName);
  Reset(storageFile);

  for i := 1 to Filesize(storageFile) do
  begin
    read(storageFile, student);
    AddStudentToStringGrid(student);
  end;

  SetStorageFilePath(OpenDialog1.FileName);
  CloseFile(storageFile);
end;

procedure TForm2.ReceiptDateAscMenuItemClick(Sender: TObject);
var students: array of studentRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(students, StringGrid1.RowCount - 1);

  for i := 1 to Length(students) do
    students[i - 1] := createStudentFromStringGrid(i);

  TArray.Sort<studentRecord>(students, TDelegatedComparer<studentRecord>.Construct(
    function(const Left, Right: studentRecord): integer
    begin
      Result := TComparer<integer>.Default.Compare(DateTimeToUnix(StrToDateTime(left.receiptDate)), DateTimeToUnix(StrToDateTime(right.receiptDate)));
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(students) - 1 do
    AddStudentToStringGrid(students[i]);
end;

procedure TForm2.ReceiptDateDescMenuItemClick(Sender: TObject);
begin
  ReceiptDateAscMenuItemClick(ReceiptDateDescMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.SaveAsMenuItemClick(Sender: TObject);
begin
  if OpenDialog1.Execute <> true then exit;

  AssignFile(storageFile, OpenDialog1.FileName);
  Rewrite(storageFile);

  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    var group: studentRecord := createStudentFromStringGrid(i);
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
    var group: studentRecord := createStudentFromStringGrid(i);
    write(storageFile, group);
  end;

  CloseFile(storageFile);
end;

procedure TForm2.SpecialtyAscMenuItemClick(Sender: TObject);
var students: array of studentRecord;
begin
  if length(storageFilePath) = 0 then exit;
  UpdateStringGridFromFile(storageFilePath);

  SetLength(students, StringGrid1.RowCount - 1);

  for i := 1 to Length(students) do
    students[i - 1] := createStudentFromStringGrid(i);

  TArray.Sort<studentRecord>(students, TDelegatedComparer<studentRecord>.Construct(
    function(const Left, Right: studentRecord): integer
    begin
      Result := TComparer<string>.Default.Compare(left.specialty, right.specialty);
    end
  ));

  StringGrid1.RowCount := 1;

  for i := 0 to Length(students) - 1 do
    AddStudentToStringGrid(students[i]);
end;

procedure TForm2.SpecialtyDescMenuItemClick(Sender: TObject);
begin
  SpecialtyAscMenuItemClick(SpecialtyAscMenuItem);
  ReverseStringGrid();
end;

procedure TForm2.SpecialtyFIlterMenuItemClick(Sender: TObject);
var
  value: string;
  students: array of studentRecord;
begin
  if length(storageFilePath) = 0 then
  begin
    ShowMessage('Данные не найдены.');
    exit;
  end;

  value := InputBox('Фильтрация по полю "Специальность"', 'Специальность:', '');

  if length(value) = 0 then exit;

  UpdateStringGridFromFile(storageFilePath);
  SetLength(students, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(students) do
    students[i - 1] := createStudentFromStringGrid(i);

  Form2.StringGrid1.RowCount := 1;

  for i := 0 to Length(students) - 1 do
    if AnsiLowerCase(Trim(students[i].specialty)) = AnsiLowerCase(Trim(value)) then AddStudentToStringGrid(students[i]);
end;

procedure TForm2.StringGrid1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  activeIndex: integer;
  students: array of studentRecord;
begin
  if StringGrid1.Row = 0 then exit;
  activeIndex := StringGrid1.Row;

  SetLength(students, StringGrid1.RowCount - 1);

  for i := 1 to StringGrid1.RowCount - 1 do
    students[i - 1] := createStudentFromStringGrid(i);

  StringGrid1.RowCount := 1;

  for i := 0 to Length(students) - 1 do
    if i + 1 <> activeIndex then AddStudentToStringGrid(students[i]);

  if StringGrid1.RowCount <= 1 then StringGrid1.Options := StringGrid1.Options - [goEditing];
end;

end.
