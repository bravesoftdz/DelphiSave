inherited frmAdministracionAccionesObservaciones: TfrmAdministracionAccionesObservaciones
  Left = 69
  Top = 46
  Width = 652
  Height = 469
  Caption = 'Administraci'#243'n de Acciones y Observaciones'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 644
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    Width = 644
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 640
      end>
    inherited ToolBar: TToolBar
      Width = 627
      HotImages = DmEmision.ilColor
      Images = DmEmision.ilByN
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Width = 644
    Height = 412
    Columns = <
      item
        Expanded = False
        FieldName = 'OB_ID'
        Title.Caption = 'C'#243'd.Observaci'#243'n'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OB_DESCRIPCION'
        Title.Caption = 'Observaci'#243'n'
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AC_DESCRIPCION'
        Title.Caption = 'Acci'#243'n'
        Width = 203
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OA_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OA_IDOBSERVACION'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OA_IDACCION'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OA_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OA_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OA_USUMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OA_FECHAMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OA_USUBAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OA_FECHABAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'OS_SUBACCION'
        Title.Caption = 'Forma de Contacto'
        Width = 119
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 80
    Top = 104
    Width = 497
    Height = 241
    DesignSize = (
      497
      241)
    inherited BevelAbm: TBevel
      Top = 205
      Width = 489
    end
    object lblObservarComoVariables: TLabel [1]
      Left = 17
      Top = 13
      Width = 63
      Height = 13
      Caption = 'Observaci'#243'n:'
    end
    object Label1: TLabel [2]
      Left = 18
      Top = 37
      Width = 36
      Height = 13
      Caption = 'Acci'#243'n:'
    end
    inherited btnAceptar: TButton
      Left = 339
      Top = 211
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 417
      Top = 211
      TabOrder = 4
    end
    object gbSubAcciones: TGroupBox
      Left = 14
      Top = 56
      Width = 475
      Height = 139
      Caption = ' Sub-Acciones  '
      TabOrder = 2
      object chkContactoTelefonico: TCheckBox
        Left = 16
        Top = 18
        Width = 125
        Height = 17
        Caption = 'Contacto Telef'#243'nico'
        TabOrder = 0
        OnClick = chkContactoTelefonicoClick
      end
      object chkContactoViaFax: TCheckBox
        Left = 16
        Top = 41
        Width = 126
        Height = 17
        Caption = 'Contacto V'#237'a Fax'
        TabOrder = 2
        OnClick = chkContactoViaFaxClick
      end
      object chkContactoMail: TCheckBox
        Left = 16
        Top = 67
        Width = 126
        Height = 17
        Caption = 'Contacto Mail'
        TabOrder = 4
        OnClick = chkContactoMailClick
      end
      object chkContactoCorreo: TCheckBox
        Left = 16
        Top = 90
        Width = 123
        Height = 17
        Caption = 'Contacto por Correo'
        TabOrder = 6
        OnClick = chkContactoCorreoClick
      end
      object chkContactoPersonal: TCheckBox
        Left = 16
        Top = 113
        Width = 127
        Height = 17
        Caption = 'Contacto Personal'
        TabOrder = 8
        OnClick = chkContactoPersonalClick
      end
      object btnIncluirTextoTelefonico: TBitBtn
        Left = 144
        Top = 16
        Width = 161
        Height = 22
        Caption = 'Incluir Texto de Gesti'#243'n'
        TabOrder = 1
        OnClick = btnIncluirTextoTelefonicoClick
      end
      object btnIncluirTextoFax: TBitBtn
        Tag = 1
        Left = 144
        Top = 39
        Width = 161
        Height = 22
        Caption = 'Incluir Texto de Gesti'#243'n'
        TabOrder = 3
        OnClick = btnIncluirTextoTelefonicoClick
      end
      object btnIncluirTextoMail: TBitBtn
        Tag = 2
        Left = 144
        Top = 63
        Width = 161
        Height = 22
        Caption = 'Incluir Texto de Gesti'#243'n'
        TabOrder = 5
        OnClick = btnIncluirTextoTelefonicoClick
      end
      object btnIncluirTextoCorreo: TBitBtn
        Tag = 3
        Left = 144
        Top = 87
        Width = 161
        Height = 22
        Caption = 'Incluir Texto de Gesti'#243'n'
        TabOrder = 7
        OnClick = btnIncluirTextoTelefonicoClick
      end
      object btnIncluirGestion: TBitBtn
        Tag = 4
        Left = 144
        Top = 111
        Width = 161
        Height = 22
        Caption = 'Indicar Gestor'
        TabOrder = 9
        OnClick = btnIncluirTextoTelefonicoClick
      end
    end
    inline FraObservaciones: TfraCodigoDescripcionExt
      Left = 88
      Top = 8
      Width = 402
      Height = 23
      Hint = 
        'Destino que a Dar a la DDJJ o Trabajador si adopta el valor espe' +
        'cificado.'
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 337
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RECHAZO'
            Visible = True
          end>
      end
    end
    inline fraAccion: TfraCodigoDescripcionExt
      Left = 88
      Top = 33
      Width = 401
      Height = 23
      Hint = 
        'Destino que a Dar a la DDJJ o Trabajador si adopta el valor espe' +
        'cificado.'
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 336
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Title.Caption = 'Descripci'#243'n'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RECHAZO'
            Visible = True
          end>
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT OB_ID, IOB.ob_descripcion, IAC.ac_descripcion, IOA.*, OS_' +
        'SUBACCION '
      '  FROM EMI.IOA_OBSERVACIONACCION IOA,'
      '       EMI.IOB_OBSERVACION IOB,'
      '       EMI.IAC_ACCION IAC,'
      '       EMI.IOS_OBSERVACIONSUBACCION'
      ' WHERE IOA.oa_idobservacion = IOB.ob_id'
      '   AND IOA.oa_idaccion = IAC.ac_id'
      '   AND OS_IDOBSERVACIONACCION = OA_ID'
      '')
  end
end
