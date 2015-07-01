inherited frmManDocumentacionFaltante: TfrmManDocumentacionFaltante
  Left = 270
  Top = 113
  Caption = 'Documentaci'#243'n Faltante'
  ClientHeight = 454
  ClientWidth = 500
  ExplicitWidth = 508
  ExplicitHeight = 484
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 500
    Height = 189
    Visible = True
    ExplicitWidth = 500
    ExplicitHeight = 189
    object gbFormaj: TGroupBox
      Left = 4
      Top = 4
      Width = 477
      Height = 57
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Forma Jur'#237'dica'
      TabOrder = 0
      DesignSize = (
        477
        57)
      inline fraFORMAJFiltro: TfraStaticCTB_TABLAS
        Left = 12
        Top = 20
        Width = 455
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 12
        ExplicitTop = 20
        ExplicitWidth = 455
        inherited cmbDescripcion: TComboGrid
          Left = 64
          Width = 391
          ExplicitLeft = 64
          ExplicitWidth = 391
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
    end
    object gbFirmante: TGroupBox
      Left = 4
      Top = 64
      Width = 477
      Height = 57
      Anchors = [akLeft, akTop, akRight]
      Caption = 'En Car'#225'cter de'
      TabOrder = 1
      DesignSize = (
        477
        57)
      inline fraFirmanteFiltro: TfraCodigoDescripcion
        Left = 11
        Top = 22
        Width = 458
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 11
        ExplicitTop = 22
        ExplicitWidth = 458
        inherited cmbDescripcion: TArtComboBox
          Width = 393
          ExplicitWidth = 393
        end
      end
    end
    object gbDoc: TGroupBox
      Left = 4
      Top = 124
      Width = 477
      Height = 57
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Documento'
      TabOrder = 2
      DesignSize = (
        477
        57)
      inline fraDocumentoFiltro: TfraCodigoDescripcion
        Left = 11
        Top = 18
        Width = 456
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 11
        ExplicitTop = 18
        ExplicitWidth = 456
        inherited cmbDescripcion: TArtComboBox
          Width = 391
          ExplicitWidth = 391
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 189
    Width = 500
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 494
      end>
    ExplicitTop = 189
    ExplicitWidth = 500
    inherited ToolBar: TToolBar
      Width = 487
      ExplicitWidth = 487
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 218
    Width = 500
    Height = 236
    Columns = <
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Forma Jur'#237'dica'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIRMANTE'
        Title.Caption = 'En Car'#225'cter de'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DF_DESCRIPCION'
        Title.Caption = 'Documento'
        Width = 150
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 108
    Top = 236
    Width = 360
    Height = 157
    BorderStyle = bsDialog
    ExplicitLeft = 108
    ExplicitTop = 236
    ExplicitWidth = 360
    ExplicitHeight = 157
    inherited BevelAbm: TBevel
      Top = 121
      Width = 352
      ExplicitTop = 121
      ExplicitWidth = 352
    end
    object Label1: TLabel [1]
      Left = 4
      Top = 8
      Width = 70
      Height = 13
      Caption = 'Forma Jur'#237'dica'
    end
    object Label2: TLabel [2]
      Left = 4
      Top = 44
      Width = 71
      Height = 13
      Caption = 'En Car'#225'cter de'
    end
    object Label3: TLabel [3]
      Left = 4
      Top = 80
      Width = 55
      Height = 13
      Caption = 'Documento'
    end
    inherited btnAceptar: TButton
      Left = 202
      Top = 127
      Width = 72
      TabOrder = 3
      ExplicitLeft = 202
      ExplicitTop = 127
      ExplicitWidth = 72
    end
    inherited btnCancelar: TButton
      Left = 280
      Top = 127
      Width = 72
      TabOrder = 4
      ExplicitLeft = 280
      ExplicitTop = 127
      ExplicitWidth = 72
    end
    inline fraSA_FORMAJ: TfraStaticCTB_TABLAS
      Left = 4
      Top = 20
      Width = 353
      Height = 23
      TabOrder = 0
      ExplicitLeft = 4
      ExplicitTop = 20
      ExplicitWidth = 353
      inherited cmbDescripcion: TComboGrid
        Left = 64
        Width = 288
        ExplicitLeft = 64
        ExplicitWidth = 288
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
    inline fraCodDocumento: TfraCodigoDescripcion
      Left = 3
      Top = 92
      Width = 354
      Height = 23
      TabOrder = 2
      ExplicitLeft = 3
      ExplicitTop = 92
      ExplicitWidth = 354
      inherited cmbDescripcion: TArtComboBox
        Width = 289
        ExplicitWidth = 289
      end
    end
    inline fraFirmante: TfraCodigoDescripcion
      Left = 3
      Top = 56
      Width = 354
      Height = 23
      TabOrder = 1
      ExplicitLeft = 3
      ExplicitTop = 56
      ExplicitWidth = 354
      inherited cmbDescripcion: TArtComboBox
        Width = 289
        ExplicitWidth = 289
      end
    end
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
  end
end
