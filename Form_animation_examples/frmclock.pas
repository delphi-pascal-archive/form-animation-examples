unit frmclock;

// Copyright (c) 2005 www.delcode.com 

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus;

type
  TfmainClock = class(TForm)
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    CloseClockroundform1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure CloseClockroundform1Click(Sender: TObject);
  private
    { Private declarations }
    hRegion : tHandle;           // Region Handle
    Currenttime : Tdatetime;     // Like counter
    X0, Y0 : integer;            // form center
    Len    : integer;            // circle radious
    procedure DrawWatchHand;     // Update watchhands
  public
    { Public declarations }
  end;

var
  fmainClock: TfmainClock;

implementation

{$R *.DFM}


{ TForm1 }

// Every WatchHand is calculated and drawed
procedure TfmainClock.DrawWatchHand;
Var
  X1, Y1      : integer;
  H, M, S, MS : Word;
  Angle       : Double;
begin
  DecodeTime(Currenttime, H, M, S, MS);

  // Now draw Second
  Canvas.MoveTo(X0, Y0);
  Angle := S * 2 * Pi / 60;
  X1 := trunc(X0 + 9*Len * Sin(Angle)/10);
  Y1 := trunc(Y0 - 9*Len * Cos(Angle)/10);
  Canvas.LineTo(X1, Y1);

  // Now draw Minute
  Canvas.MoveTo(X0, Y0);
  Angle := M * 2 * Pi / 60;
  X1 := trunc(X0 + 3*Len * Sin(Angle)/4);
  Y1 := trunc(Y0 - 3*Len * Cos(Angle)/4);
  Canvas.LineTo(X1, Y1);

  // Now draw Hour
  Canvas.MoveTo(X0, Y0);
  Angle := H * 2 * Pi / 12;
  X1 := trunc(X0 + Len * Sin(Angle)/2);
  Y1 := trunc(Y0 - Len * Cos(Angle)/2);
  Canvas.LineTo(X1, Y1);

end;

procedure TfmainClock.FormCreate(Sender: TObject);
Var
  R       : Trect;
  Len2    : integer;
begin
   hRegion := 0;
   
   X0 := ClientWidth div 2;
   Y0 := ClientHeight div 2;
   if X0<Y0 then
     Len := X0 * 9 div 10
   else
     Len := Y0 * 9 div 10;

   Currenttime := time;

   // Set Non Rectagular form
   Len2 := len * 10 div 9;
   R.Top    := Y0 - Len2;
   R.Bottom := Y0 + Len2;
   R.Left   := X0 - Len2;
   R.Right  := X0 + Len2;

//   The CreateEllipticRgnIndirect function creates
//   an elliptical region.
   hRegion := CreateEllipticRgnIndirect(R);

// The SetWindowRgn function sets the window region of a window.
   SetWindowRgn(handle, hRegion, true);
end;

procedure TfmainClock.Timer1Timer(Sender: TObject);
begin
   Canvas.Pen.Color := clWhite;
   DrawWatchHand;   // clear
   currenttime := time;
   Canvas.Pen.Color := clBlack;
   DrawWatchHand;   // set
end;

// Draw 12 digits
procedure TfmainClock.FormPaint(Sender: TObject);
Var
   X1, Y1, i : integer;
   Angle     : double;
begin
  Canvas.Pen.Mode := pmXor;
  Canvas.Pen.Color := clWhite;
  for i:=1 to 12 do
   begin
    Angle := i * 2 * Pi / 12;
    X1 := trunc(X0 + Len * Sin(Angle));
    Y1 := trunc(Y0 - Len * Cos(Angle));
    Canvas.TextOut (X1-4,Y1-6,inttostr(i))
   end;
  Canvas.Pen.Mode := pmCopy;
  Canvas.Pen.Color := clBlack;
end;

// Form movement. Without title is necesary to use the MouseDown event

procedure TfmainClock.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(wm_Syscommand, $f012, 0)
end;

procedure TfmainClock.FormDestroy(Sender: TObject);
begin
//  The DeleteObject function deletes a logical pen,
//  brush, font, bitmap, region, or palette, freeing
//  all system resources associated with the object.
//  After the object is deleted, the specified handle
//  is no longer valid.
  DeleteObject(hRegion)
end;

procedure TfmainClock.CloseClockroundform1Click(Sender: TObject);
begin
//Close the form that represents the clock
close;
end;

end.
