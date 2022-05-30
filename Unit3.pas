unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    TitleEdit: TEdit;
    DurationEdit: TEdit;
    Label2: TLabel;
    AgeLimitEdit: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    AddPerfomanceButton: TButton;
    PriceEdit: TEdit;
    PremiereDateDateTimePicker: TDateTimePicker;
    DaysListBox: TListBox;
    CategoryComboBox: TComboBox;
    procedure PriceEditKeyPress(Sender: TObject; var Key: Char);
    procedure AddPerfomanceButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm3.AddPerfomanceButtonClick(Sender: TObject);
var
  perfomance: PerformanceRecord;
  i: integer;
begin
  for i := 0 to Form3.ComponentCount - 1 do
    if Form3.Components[i] is TEdit then
      if TEdit(Form3.Components[i]).Text = '' then
      begin
        ShowMessage('Заполните все поля!');
        exit;
      end;

  perfomance.title := TitleEdit.Text;
  perfomance.duration := DurationEdit.Text;
  perfomance.ageLimit := AgeLimitEdit.Text;
  perfomance.category := CategoryComboBox.Text;
  perfomance.price := PriceEdit.Text;
  perfomance.premiereDate := DateToStr(PremiereDateDateTimePicker.Date);
  perfomance.days := '';

  for i := 0 to DaysListBox.Items.Count - 1 do
     if DaysListBox.Selected[i]
      then perfomance.days := perfomance.days + DaysListBox.Items.Strings[i] + ', ';

  // Удаляем запятую и пробел
  Delete(perfomance.days, Length(perfomance.days) - 1, 2);

  if Length(perfomance.days) = 0 then
  begin
    ShowMessage('Заполните все поля!');
    exit;
  end;

  AddPerfomanceToStringGrid(perfomance);
  Form3.Close;
end;

procedure TForm3.PriceEditKeyPress(Sender: TObject; var Key: Char);
begin
  // Разрешаем ввод только цифр и запятой
  if not (Key in ['0'..'9', ',', #8]) then Key := #0;
end;

end.
