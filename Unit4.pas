unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Unit2;

type
  TForm4 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    IncreaseCourseButton: TButton;
    procedure FormActivate(Sender: TObject);
    procedure IncreaseCourseButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormActivate(Sender: TObject);
var
  i: integer;
  students: array of studentRecord;
begin
  SetLength(students, Form2.StringGrid1.RowCount - 1);

  for i := 1 to Length(students) do
    students[i - 1] := createStudentFromStringGrid(i);

  for i := 0 to Length(students) - 1 do
    ListBox1.Items.Add(students[i].fullname);
end;

procedure TForm4.IncreaseCourseButtonClick(Sender: TObject);
var
  i, firstNumber: integer;
  groupStrNumber: string;
begin
  for i := 0 to ListBox1.Items.Count - 1 do
    if ListBox1.Selected[i] = true then
    begin
      groupStrNumber := Form2.StringGrid1.Cells[5, i + 1];
      firstNumber := StrToInt(groupStrNumber[1]) + 1;
      Form2.StringGrid1.Cells[5, i + 1] := IntToStr(firstNumber) + Copy(groupStrNumber, 2);
    end;
end;

end.
