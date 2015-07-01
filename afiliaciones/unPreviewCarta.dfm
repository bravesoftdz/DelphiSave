inherited frmPreviewCarta: TfrmPreviewCarta
  Left = 217
  Top = 108
  Caption = 'frmPreviewCarta'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 596
    Top = 424
    Width = 6
    Height = 25
    Anchors = [akRight, akBottom]
    Shape = bsRightLine
  end
  inherited btnAceptar: TButton
    Left = 521
    ModalResult = 0
    TabOrder = 3
    OnClick = btnAceptarClick
  end
  inherited btnCancelar: TButton
    TabOrder = 4
  end
  inherited fraToolbarRTF: TfraToolbarRTF
    TabOrder = 2
    inherited tBarRTF: TToolBar
      inherited ToolButton5: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
    end
  end
  object btnImprimir: TButton
    Left = 441
    Top = 424
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Imprimir'
    TabOrder = 1
    OnClick = btnAceptarClick
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT CA_ID, CA_IDTEXTOCARTA, CA_CORREO, CA_TIPOSALIDA, CA_IDFI' +
        'RMA, CA_OBSERVACIONES, CA_IDFORMULARIO, CA_IDENDOSO, CA_MANUAL, ' +
        'CA_TEXTOFINAL, CA_IDDELEGACION, CA_USUALTA, CA_FECHAALTA'
      'FROM CCA_CARTA')
    UpdateObject = sduDatos
    Left = 16
    Top = 44
  end
  object sduDatos: TSDUpdateSQL
    Left = 44
    Top = 44
  end
end
