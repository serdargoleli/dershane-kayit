unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask;

type
  TForm5 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    GroupBox2: TGroupBox;
    DBImage1: TDBImage;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

Uses Unit2, Unit3;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
  Form5.Hide;
  form3.Show;
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and (DBEdit3.Text <> '') and
    (DBEdit7.Text <> '') and (DBEdit8.Text <> '') and (DBEdit9.Text <> '') and
    (DBComboBox1.Text <> '') and (DBComboBox4.Text <> '') and
    (DBComboBox3.Text <> '') then
  begin
    form2.table.Edit;
    form2.table.Refresh;
    Application.MessageBox('Öðrenci Bilgileri Güncellendi',
      'Öðrenci Bilgi Güncelleme', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin
    Application.MessageBox('Tüm alanlarý doldurunuz', 'Öðrenci Kayýt ',
      MB_OK + MB_ICONINFORMATION);
    form2.table.Cancel;
  end;

end;

procedure TForm5.BitBtn3Click(Sender: TObject);
var
  sorgu: Integer;
begin
  sorgu := Application.MessageBox('Seçilen Kayýt Silinsin mi?',
    'Dershane Kayýt Otomasyonu', MB_YESNO + MB_ICONQUESTION);
  if sorgu = idYes then
  begin
    form2.table.Delete;

  end;
end;

procedure TForm5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
