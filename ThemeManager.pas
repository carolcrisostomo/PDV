unit ThemeManager;


interface

uses
  Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Controls, Vcl.Forms, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls;

type
  TThemeManager = class
  public
    class procedure ApplyDarkTheme(AForm: TCustomForm);
  end;

implementation

// ============================================================================
//  PROPRIEDADES DO TEMA (customizáveis)
// ============================================================================

// Background principal
const
  COLOR_BG          = $00202020;  // fundo escuro
  COLOR_PANEL       = $00282828;  // painéis
  COLOR_INPUT       = $00303030;  // edits
  COLOR_GRID        = $00262626;  // grid background

// Texto
  COLOR_TEXT        = clWhite;
  COLOR_TEXT_LIGHT  = $00E0E0E0;

// Botões
  COLOR_BTN_BG      = $00404040;
  COLOR_BTN_HOVER   = $00505050;
  COLOR_BTN_BORDER  = $00606060;

// Grid
  COLOR_GRID_LINES  = $00404040;
  COLOR_GRID_HEADER = $00353535;
  COLOR_GRID_HEADER_FONT = clWhite;

// ============================================================================
//  FUNÇÃO CENTRAL
// ============================================================================

class procedure TThemeManager.ApplyDarkTheme(AForm: TCustomForm);
var
  I: Integer;
  C: TControl;
begin
  if AForm = nil then
    Exit;

  AForm.Color := COLOR_BG;

  for I := 0 to AForm.ComponentCount - 1 do
  begin
    C := AForm.Components[I] as TControl;

    // --- PANELS ---
    if C is TPanel then
    begin
      TPanel(C).Color := COLOR_PANEL;
      TPanel(C).Font.Color := COLOR_TEXT;
    end;

    // --- LABELS ---
    if C is TLabel then
    begin
      TLabel(C).Font.Color := COLOR_TEXT_LIGHT;
    end;
  end;
end;

    //

end.
