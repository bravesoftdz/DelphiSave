object frmEnviarSolicitudAuditoria: TfrmEnviarSolicitudAuditoria
  Left = 323
  Top = 269
  BorderStyle = bsDialog
  Caption = 'Enviar Solicitud de Auditor'#237'a'
  ClientHeight = 84
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 2
    Width = 440
    Height = 43
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 36
      Height = 13
      Caption = 'Auditor:'
    end
    inline fraAuditor: TfraStaticCodigoDescripcion
      Left = 48
      Top = 8
      Width = 386
      Height = 23
      TabOrder = 0
      ExplicitLeft = 48
      ExplicitTop = 8
      ExplicitWidth = 386
      inherited cmbDescripcion: TComboGrid
        Width = 323
        ExplicitWidth = 323
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 45
    Width = 440
    Height = 39
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 1
    object btnVistaPrevia: TButton
      Left = 5
      Top = 8
      Width = 76
      Height = 25
      Caption = 'Vista Previa'
      TabOrder = 0
      OnClick = btnVistaPreviaClick
    end
    object btnEnviadoMano: TButton
      Left = 181
      Top = 8
      Width = 84
      Height = 25
      Caption = 'Enviar en mano'
      TabOrder = 1
      Visible = False
      OnClick = btnEnviadoManoClick
    end
    object btnModificarAudit: TButton
      Left = 269
      Top = 8
      Width = 86
      Height = 25
      Caption = 'Modificar Auditor'
      TabOrder = 2
      Visible = False
      OnClick = btnModificarAuditClick
    end
    object btnGenerarEnvio: TButton
      Left = 274
      Top = 8
      Width = 79
      Height = 25
      Caption = 'Generar Env'#237'o'
      TabOrder = 3
      OnClick = btnGenerarEnvioClick
    end
    object btnCancelar: TButton
      Left = 358
      Top = 8
      Width = 76
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btnCancelarClick
    end
  end
end
