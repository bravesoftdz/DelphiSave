inherited frmReferentesDel: TfrmReferentesDel
  Left = 534
  Top = 231
  Caption = 'Referentes Delegaci'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 53
    Visible = True
    object gbDelegacion: TGroupBox
      Left = 2
      Top = 0
      Width = 289
      Height = 53
      Caption = 'Delegaci'#243'n'
      TabOrder = 0
      DesignSize = (
        289
        53)
      inline fraDelegacionFiltro: TfraDelegacion
        Left = 7
        Top = 17
        Width = 274
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          274
          23)
        inherited cmbDescripcion: TArtComboBox
          Left = 41
          Top = 0
          Width = 230
        end
        inherited edCodigo: TPatternEdit
          Top = 0
          Width = 36
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 296
      Top = 0
      Width = 293
      Height = 53
      Caption = 'Tipo Referente'
      TabOrder = 1
      inline fraTipoReferenteFiltro: TfraCodigoDescripcion
        Left = 6
        Top = 17
        Width = 280
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 215
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 53
    inherited ToolBar: TToolBar
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 82
    Height = 355
    Columns = <
      item
        Expanded = False
        FieldName = 'DE_DELEGACION'
        Title.Caption = 'Delegaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EL_NOMBRE'
        Title.Caption = 'Nombre'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DE_TIPOREFERENTE'
        Title.Caption = 'Tipo Referente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DE_REFERENTE'
        Title.Caption = 'Referente'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Width = 429
    Height = 165
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 129
      Width = 421
    end
    object lblDelegacion: TLabel [1]
      Left = 16
      Top = 28
      Width = 54
      Height = 13
      Caption = 'Delegaci'#243'n'
    end
    object lblUsuario: TLabel [2]
      Left = 16
      Top = 60
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label1: TLabel [3]
      Left = 16
      Top = 91
      Width = 71
      Height = 13
      Caption = 'Tipo Referente'
    end
    inherited btnAceptar: TButton
      Left = 271
      Top = 135
    end
    inherited btnCancelar: TButton
      Left = 349
      Top = 135
    end
    inline fraDelegacionABM: TfraDelegacion
      Left = 99
      Top = 23
      Width = 326
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DesignSize = (
        326
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 41
        Top = 0
        Width = 276
      end
      inherited edCodigo: TPatternEdit
        Top = 0
        Width = 38
      end
    end
    inline fraUsuarios: TfraUsuarios
      Left = 99
      Top = 54
      Width = 318
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      inherited cmbDescripcion: TArtComboBox
        Left = 84
        Width = 233
      end
      inherited edCodigo: TPatternEdit
        Width = 81
      end
    end
    inline fraTipoReferente: TfraCodigoDescripcion
      Left = 99
      Top = 85
      Width = 319
      Height = 23
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 254
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT DE_ID, DE_DELEGACION,  EL_NOMBRE, DE_TIPOREFERENTE, DE_RE' +
        'FERENTE, DE_FECHABAJA'
      '   FROM ART.RDE_REFERENTESDELEGACION, ART.DEL_DELEGACION'
      ' WHERE DE_FECHABAJA IS NULL'
      '      AND DE_DELEGACION = EL_ID')
  end
  object ShortCutControl1: TShortCutControl
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
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 56
    Top = 316
  end
end
