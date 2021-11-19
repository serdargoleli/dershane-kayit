unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons;

type
  TForm4 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    GroupBox2: TGroupBox;
    DBImage1: TDBImage;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

Uses Unit2, Unit3;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
  Form4.Hide;
  form3.Show;
  form2.table.Cancel;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and (DBEdit3.Text <> '') and
    (DBEdit7.Text <> '') and (DBEdit8.Text <> '') and (DBEdit9.Text <> '') and
    (DBComboBox1.Text <> '') and (DBComboBox4.Text <> '') and
    (DBComboBox3.Text <> '') then
  begin
    form2.table.edit;
    form2.table.Post;
    Application.MessageBox('Öðrenci Bilgileri Kaydedildi', 'Öðrenci Kayýt ',
      MB_OK + MB_ICONINFORMATION);
    form2.table.Insert;
  end
  else
    Application.MessageBox('Tüm alanlarý doldurunuz', 'Öðrenci Kayýt ',
      MB_OK + MB_ICONINFORMATION);

end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  sorgu: Integer;
begin
  CanClose := false;
  sorgu := Application.MessageBox('Uygulama kapatýlsýn mý?',
    'Dershane Kayýt Otomasyonu', MB_YESNO + MB_ICONQUESTION);
  if sorgu = idYes then
  begin
    CanClose := true;
    Application.Terminate;
  end;

end;

end.
