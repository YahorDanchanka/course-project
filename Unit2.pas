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
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  studentRecord = record
    fullname, birthday, phone, address, specialty, groupNumber, receiptDate: string[20];
  end;
  procedure AddStudentToStringGrid(student: studentRecord);

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

end.
