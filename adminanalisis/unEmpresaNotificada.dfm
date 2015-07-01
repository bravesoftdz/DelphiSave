inherited frmEmpresaNotificada: TfrmEmpresaNotificada
  Caption = 'Notificaciones de Empresas para armado de CD'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'EM_CUIT'
        Title.Caption = 'CUIT'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EM_NOMBRE'
        Title.Caption = 'Raz'#243'n Social'
        Width = 434
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 72
    inherited BevelAbm: TBevel
      Top = 36
    end
    object lblCUIT: TLabel [1]
      Left = 12
      Top = 13
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    inherited btnAceptar: TButton
      Top = 42
    end
    inherited btnCancelar: TButton
      Top = 42
    end
    inline fraEmpresa: TfraEmpresa
      Left = 42
      Top = 8
      Width = 412
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      DesignSize = (
        412
        22)
      inherited lbRSocial: TLabel
        Left = 89
      end
      inherited lbContrato: TLabel
        Left = 308
      end
      inherited edContrato: TIntEdit
        Left = 355
      end
      inherited cmbRSocial: TArtComboBox
        Left = 141
        Width = 164
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   em_cuit, em_nombre, en_id, en_idempresa, en_fechaalta, ' +
        'en_usualta, en_fechamodif, en_usumodif, en_fechabaja,'
      '         en_usubaja'
      '    FROM hys.hen_empresanotificacion, afi.aem_empresa'
      '   WHERE en_idempresa = em_id'
      'ORDER BY 1'
      '')
  end
end
