unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Unit2,
  Vcl.Mask;

type
  TForm3 = class(TForm)
    AddStudentButton: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    MaskEdit1: TMaskEdit;
    SpecialtyComboBox: TComboBox;
    procedure AddStudentButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.AddStudentButtonClick(Sender: TObject);
var
  student: studentRecord;
  i: integer;
begin
  for i := 0 to Form3.ComponentCount - 1 do
    if (Form3.Components[i] is TEdit) or (Form3.Components[i] is TComboBox) then
      if TEdit(Form3.Components[i]).Text = '' then
      begin
        ShowMessage('Заполните все поля!');
        exit;
      end;

  student.fullname := Edit1.Text;
  student.birthday := DateToStr(DateTimePicker1.Date);
  student.phone := MaskEdit1.Text;
  student.address := Edit4.Text;
  student.specialty := SpecialtyComboBox.Text;
  student.groupNumber := Edit6.Text;
  student.receiptDate := DateToStr(DateTimePicker2.Date);
  AddStudentToStringGrid(student);
  Form3.Close;
end;

end.
