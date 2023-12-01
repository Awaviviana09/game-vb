unit game2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    apel: TImage;
    ulat: TImage;
    keranjang: TImage;
    btnMain: TButton;
    lblWaktu: TLabel;
    lblSkor: TLabel;
    Lbl60: TLabel;
    Lbl0: TLabel;
    Label5: TLabel;
    ApelTime: TTimer;
    UlatTime: TTimer;
    WaktuTime: TTimer;
    label1: TLabel;
    procedure btnMainClick(Sender: TObject);
    procedure WaktuTimeTimer(Sender: TObject);
    procedure UlatTimeTimer(Sender: TObject);
    procedure ApelTimeTimer(Sender: TObject);
    procedure useMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Overlay : TRect;

implementation

{$R *.dfm}

procedure TForm1.btnMainClick(Sender: TObject);
begin
  btnMain.Font.Size := 12;
  btnMain.Caption := 'Play Again?';
  btnMain.Enabled := false;
  panel1.Enabled := true;
  apelTime.Enabled := true;
  keranjang.Visible := true;
  apel.Visible := true;
  panel1.Caption := '';
  apel.Top :=0;
  lbl60.Caption := '30';
  lbl60.Tag := 30;
  lbl0.Caption := '0';
  lbl0.Tag := 0;
  label1.Visible := false;
  waktuTime.Enabled := true;
  ulat.Visible := true;
  ulatTime.Enabled := true

end;

procedure TForm1.WaktuTimeTimer(Sender: TObject);
begin
  lbl60.Tag := lbl60.Tag-1;
  lbl60.Caption := inttostr(lbl60.Tag);

  if lbl60.Tag = 0 then
  begin
    btnMain.Enabled := true;
    waktuTime.Enabled := false;
    panel1.Enabled := false;
    apelTime.Enabled := false;
    keranjang.visible := false;
    apel.Visible := false;
    panel1.Caption := 'Klik Play Again, untuk memainkan kembali ! ';
    label1.Visible := true;
    label1.Caption := 'Skor anda adalah ' + lbl0.caption ;
    ulatTime.Enabled := false;
    ulat.Visible := false;
    end;
end;

procedure TForm1.UlatTimeTimer(Sender: TObject);
begin
  ulat.Top := ulat.Top+15;
  if ulat.Top > panel1.Height then
  begin
    ulat.Top := 0;
    ulat.left := random(panel1.Width);
    end;
    if intersectRect(Overlay, ulat.BoundsRect, keranjang.BoundsRect) then
    begin
      ulat.Visible := true;
      ulat.Top := 0;
      ulat.Left := random(panel1.Width);
      lbl0.Tag := lbl0.Tag - 2;
      lbl0.Caption := inttostr(lbl0.Tag);
      end;
end;

procedure TForm1.ApelTimeTimer(Sender: TObject);
begin
  apel.Top := apel.Top+15;
  if apel.Top > panel1.Height then
  begin
    apel.Top := 0;
    apel.left := random(panel1.Width);
    end;
    if intersectRect(Overlay, apel.BoundsRect, keranjang.BoundsRect) then
    begin
      apel.Visible := true;
      apel.Top := 0;
      apel.Left := random(panel1.Width);
      lbl0.Tag := lbl0.Tag+1;
      lbl0.Caption := inttostr(lbl0.Tag);
      end;
end;

procedure TForm1.useMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  keranjang.Left := X- keranjang.Width div 5;
   panel1.Cursor := crHelp;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
keranjang.Top := 400;
apel.Top := 0;
label1.Visible := false;
ulat.Top := 0;
end;

end.
