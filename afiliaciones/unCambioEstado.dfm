object frmCambioEstado: TfrmCambioEstado
  Left = 927
  Top = 276
  ActiveControl = fraEstadoNew.edCodigo
  BorderStyle = bsDialog
  Caption = 'Cambio de Estado'
  ClientHeight = 187
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  DesignSize = (
    520
    187)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 4
    Top = 144
    Width = 512
    Height = 8
    Anchors = [akRight, akBottom]
    Shape = bsBottomLine
  end
  object lbEstado: TLabel
    Left = 8
    Top = 12
    Width = 66
    Height = 13
    Caption = 'Estado Actual'
  end
  object lbNew: TLabel
    Left = 8
    Top = 36
    Width = 68
    Height = 13
    Caption = 'Nuevo Estado'
  end
  object Label1: TLabel
    Left = 8
    Top = 60
    Width = 62
    Height = 13
    Caption = 'Doc. Adjunto'
  end
  object Label2: TLabel
    Left = 8
    Top = 84
    Width = 53
    Height = 13
    Caption = 'Comentario'
  end
  object btGuardar: TButton
    Left = 360
    Top = 158
    Width = 72
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Guardar'
    TabOrder = 0
    OnClick = btGuardarClick
  end
  object btSalir: TButton
    Left = 440
    Top = 158
    Width = 72
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Salir'
    TabOrder = 1
    OnClick = btSalirClick
  end
  inline fraSA_ESTADO: TfraStaticCTB_TABLAS
    Left = 80
    Top = 8
    Width = 436
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    inherited cmbDescripcion: TComboGrid
      Width = 372
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja'
        'TB_CLAVE'
        'TB_ESPECIAL1')
      ColWidths = (
        40
        300
        -1
        -1
        -1
        -1)
    end
  end
  inline fraEstadoNew: TfraStaticCTB_TABLAS
    Left = 80
    Top = 32
    Width = 436
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    inherited cmbDescripcion: TComboGrid
      Width = 372
      Cells = (
        'C'#243'digo'
        'Descripci'#243'n'
        'Id'
        'Fecha de Baja'
        'TB_CLAVE'
        'TB_ESPECIAL1')
      ColWidths = (
        40
        300
        -1
        -1
        -1
        -1)
    end
  end
  object edArchivo: TFilenameEdit
    Left = 81
    Top = 56
    Width = 433
    Height = 21
    NumGlyphs = 1
    TabOrder = 4
  end
  object edComentario: TMemo
    Left = 80
    Top = 80
    Width = 433
    Height = 65
    TabOrder = 5
  end
end
