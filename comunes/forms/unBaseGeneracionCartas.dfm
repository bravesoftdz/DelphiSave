object frmBaseGeneracionCartas: TfrmBaseGeneracionCartas
  Left = 314
  Top = 137
  Width = 663
  Height = 550
  Caption = 'Generaci'#243'n de Cartas'
  Color = clBtnFace
  Constraints.MinHeight = 550
  Constraints.MinWidth = 663
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 262
    Width = 653
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object pnlInferior: TPanel
    Left = 0
    Top = 265
    Width = 653
    Height = 256
    Align = alClient
    BevelOuter = bvNone
    Constraints.MinHeight = 130
    TabOrder = 1
    DesignSize = (
      653
      256)
    object Bevel2: TBevel
      Left = 7
      Top = 224
      Width = 646
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsBottomLine
    end
    object Bevel1: TBevel
      Left = 570
      Top = 231
      Width = 5
      Height = 29
      Anchors = [akRight, akBottom]
      Shape = bsLeftLine
    end
    inline fraToolbarRTF: TfraToolbarRTF
      Left = 0
      Top = 0
      Width = 653
      Height = 31
      Align = alTop
      TabOrder = 0
      inherited tBarRTF: TToolBar
        Width = 653
        inherited tbImprimir: TToolButton
          Visible = False
        end
        inherited ToolButton3: TToolButton
          Visible = False
        end
      end
    end
    object edTexto: TRxRichEdit
      Left = 3
      Top = 36
      Width = 648
      Height = 185
      Anchors = [akLeft, akTop, akRight, akBottom]
      Constraints.MinHeight = 49
      TabOrder = 1
    end
    object btnImprimir: TButton
      Left = 412
      Top = 232
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Imprimir'
      TabOrder = 2
      OnClick = btnAceptarClick
    end
    object btnAceptar: TButton
      Left = 491
      Top = 232
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      TabOrder = 3
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 577
      Top = 232
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 4
    end
  end
  object pnlSuperior: TPanel
    Left = 0
    Top = 0
    Width = 653
    Height = 262
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 123
      Width = 653
      Height = 139
      Align = alClient
      BevelOuter = bvNone
      Constraints.MinHeight = 35
      TabOrder = 2
      DesignSize = (
        653
        139)
      object Label7: TLabel
        Left = 15
        Top = 4
        Width = 37
        Height = 13
        Caption = 'O&bserv.'
        FocusControl = edObservaciones
      end
      object edObservaciones: TMemo
        Left = 56
        Top = 0
        Width = 596
        Height = 138
        Anchors = [akLeft, akTop, akRight, akBottom]
        MaxLength = 1500
        TabOrder = 0
      end
    end
    object pnlDatos: TPanel
      Left = 0
      Top = 41
      Width = 653
      Height = 82
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        653
        82)
      object Label2: TLabel
        Left = 18
        Top = 4
        Width = 35
        Height = 13
        Caption = 'M'#243'd&ulo'
      end
      object Label3: TLabel
        Left = 352
        Top = 5
        Width = 27
        Height = 13
        Caption = 'T&exto'
      end
      object Label4: TLabel
        Left = 13
        Top = 32
        Width = 40
        Height = 13
        Caption = '&Firmante'
      end
      object Label5: TLabel
        Left = 341
        Top = 32
        Width = 38
        Height = 13
        Caption = 'Fo&rmato'
      end
      object Label6: TLabel
        Left = 22
        Top = 59
        Width = 31
        Height = 13
        Caption = 'C&orreo'
      end
      object Label10: TLabel
        Left = 332
        Top = 60
        Width = 47
        Height = 13
        Caption = 'Cod. ART'
      end
      inline fraCtbTablasCorreo: TfraStaticCTB_TABLAS
        Left = 55
        Top = 54
        Width = 273
        Height = 24
        TabOrder = 4
        inherited cmbDescripcion: TComboGrid
          Width = 209
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
      inline fraCtbTablasTipoSalida: TfraStaticCTB_TABLAS
        Left = 382
        Top = 27
        Width = 269
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        inherited cmbDescripcion: TComboGrid
          Width = 205
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
      inline fraCodigoModulo: TfraStaticCodigoDescripcion
        Left = 55
        Top = 0
        Width = 273
        Height = 25
        TabOrder = 0
        inherited cmbDescripcion: TComboGrid
          Width = 210
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
      inline fraCodigoCodFirmante: TfraStaticCodigoDescripcion
        Left = 55
        Top = 27
        Width = 273
        Height = 24
        TabOrder = 2
        inherited cmbDescripcion: TComboGrid
          Width = 210
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
      inline fraARTs: TfraStaticCodigoDescripcion
        Left = 382
        Top = 54
        Width = 269
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        inherited cmbDescripcion: TComboGrid
          Width = 206
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
      inline fraCodigoCodTexto: TfraCodigoDescripcion
        Left = 382
        Top = 0
        Width = 269
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        inherited cmbDescripcion: TArtComboBox
          Width = 204
        end
      end
    end
    object pnlAdicional: TPanel
      Left = 0
      Top = 0
      Width = 653
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
    end
  end
  object Seguridad1: TSeguridad
    AutoEjecutar = True
    Claves = <>
    DBLogin = frmPrincipal.DBLogin
    PermitirEdicion = False
    Left = 4
    Top = 247
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 32
    Top = 247
  end
  object sdqDatos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    UpdateObject = sduDatos
    Left = 4
    Top = 274
  end
  object sduDatos: TSDUpdateSQL
    ModifySQL.Strings = (
      'BEGIN'
      '  IF :CA_FECHAIMPRESION IS NULL THEN'
      '    UPDATE CCA_CARTA'
      '       SET CA_IDAREATEXTO = :CA_IDAREATEXTO,'
      '           CA_IDTEXTOCARTA = :CA_IDTEXTOCARTA,'
      '           CA_TEXTOFINAL = :CA_TEXTOFINAL,'
      '           CA_CORREO = :CA_CORREO,'
      '           CA_IDFIRMA = :CA_IDFIRMA,'
      '           CA_TIPOSALIDA = :CA_TIPOSALIDA,'
      '           CA_OBSERVACIONES = :CA_OBSERVACIONES,'
      '           CA_USUMODIF = :CA_USUMODIF,'
      '           CA_FECHAMODIF = SYSDATE,'
      '           CA_IDART = :CA_IDART'
      '     WHERE CA_ID = :CA_ID;'
      '  ELSE'
      '    UPDATE CCA_CARTA'
      '       SET CA_CORREOREIMPRESION = :CA_CORREO,'
      '           CA_IDFIRMAREIMPRESION = :CA_IDFIRMA,'
      '           CA_OBSERVACIONES = :CA_OBSERVACIONES,'
      '           CA_USUMODIF = :CA_USUMODIF,'
      '           CA_FECHAMODIF = SYSDATE'
      '     WHERE CA_ID = :CA_ID;'
      '  END IF;'
      'END;'
      ' ')
    InsertSQL.Strings = (
      'INSERT INTO CCA_CARTA'
      '(CA_ID, CA_IDTEXTOCARTA, CA_CORREO, CA_TIPOSALIDA, CA_IDFIRMA,'
      
        ' CA_OBSERVACIONES, CA_IDFORMULARIO, CA_IDENDOSO, CA_IDEMPDEUDORA' +
        ', CA_MANUAL,'
      
        ' CA_TEXTOFINAL, CA_IDDELEGACION, CA_IDAREATEXTO, CA_USUALTA, CA_' +
        'FECHAALTA,'
      
        ' CA_IDEXPEDIENTE, CA_IDTRABAJADOR, CA_IDART, CA_IDDESTINATARIOCA' +
        'RTA)'
      'VALUES'
      
        '(:CA_ID, :CA_IDTEXTOCARTA, :CA_CORREO, :CA_TIPOSALIDA, :CA_IDFIR' +
        'MA,'
      
        ' :CA_OBSERVACIONES, :CA_IDFORMULARIO, :CA_IDENDOSO, :CA_IDEMPDEU' +
        'DORA, :CA_MANUAL,'
      
        ' :CA_TEXTOFINAL, :CA_IDDELEGACION, :CA_IDAREATEXTO, :CA_USUALTA,' +
        ' ACTUALDATE,'
      
        ' :CA_IDEXPEDIENTE, :CA_IDTRABAJADOR, :CA_IDART, :CA_IDDESTINATAR' +
        'IOCARTA)')
    Left = 32
    Top = 274
  end
end
