unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Unit2,
  Vcl.Mask;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    FullnameEdit: TEdit;
    Label2: TLabel;
    VisitsCountEdit: TEdit;
    Label3: TLabel;
    PriceEdit: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ExpiresEdit: TEdit;
    Label7: TLabel;
    AddGroupButton: TButton;
    TicketTypeComboBox: TComboBox;
    DateTimePicker1: TDateTimePicker;
    PassportEdit: TMaskEdit;
    procedure AddGroupButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.AddGroupButtonClick(Sender: TObject);
var
  i: integer;
  group: groupRecord;
begin
  for i := 0 to Form3.ComponentCount - 1 do
  begin
    if Form3.Components[i] is TEdit then
      if TEdit(Form3.Components[i]).Text = '' then
      begin
        ShowMessage('Заполните все поля!');
        exit;
      end;

    if (Pos(' ', PassportEdit.Text) <> 0) or (TicketTypeComboBox.ItemIndex = -1) then
    begin
      ShowMessage('Заполните все поля!');
      exit;
    end;
  end;

  group.fullname := FullnameEdit.Text;
  group.passport := PassportEdit.Text;
  group.visitsCount := VisitsCountEdit.Text;
  group.price := PriceEdit.Text;
  group.ticketType := TicketTypeComboBox.Items[TicketTypeComboBox.ItemIndex];
  group.startedDate := DateToStr(DateTimePicker1.Date);
  group.expires := ExpiresEdit.Text;
  AddGroupToStringGrid(group);
  Form3.Close;
end;

end.
