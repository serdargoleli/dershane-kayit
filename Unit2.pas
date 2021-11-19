unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Data.Win.ADODB, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    baglanti: TADOConnection;
    table: TADOTable;
    Data: TDataSource;
    tableOgrenciNo: TAutoIncField;
    tableTc: TWideStringField;
    tableAdSoyad: TWideStringField;
    tableSinif: TWideStringField;
    tableBolum: TWideStringField;
    tableDal: TWideStringField;
    tableCinsiyet: TWideStringField;
    tableVeliNo: TWideStringField;
    tableAdres: TWideStringField;
    tableUcret: TBCDField;
    tableResim: TBlobField;
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

Uses Unit3;

procedure TForm2.BitBtn1Click(Sender: TObject);
const
  Yol = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s; Persist Security Info=False';
var
  veriTabani: String;
begin
  if (Edit1.Text = 'sevinturan') and (Edit2.Text = '123456') then
  begin
    veriTabani := ExtractFilePath(Application.Exename) + 'dershane.mdb';
    baglanti.ConnectionString := Format(Yol, [veriTabani]);
    baglanti.Connected := true;
    table.Active := true;
    form3.show;
    Form2.Hide;
  end
  else
    Application.MessageBox('Kullanýcý Adý Veya Þifre Hatalý.Tekrar Deneyin',
      'HATALI GÝRÝÞ', MB_OK + MB_ICONHAND);
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  if (CheckBox1.Checked) then
    Edit2.PasswordChar := #0
  else
    Edit2.PasswordChar := '*';
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
