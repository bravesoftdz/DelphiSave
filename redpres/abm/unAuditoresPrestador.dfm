inherited frmAuditoresPorPrestador: TfrmAuditoresPorPrestador
  Left = 481
  Top = 309
  Width = 792
  Caption = 'Auditores Por Prestador'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 784
    Height = 44
    Visible = True
    object GroupBox3: TGroupBox
      Left = 2
      Top = 0
      Width = 543
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Prestador'
      TabOrder = 0
      DesignSize = (
        543
        42)
      inline fraPrestadorFiltro: TfraPrestador
        Left = 3
        Top = 14
        Width = 534
        Height = 24
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        TabStop = True
        inherited lbCPostal: TLabel
          Left = 445
        end
        inherited lbTelefono: TLabel
          Left = 357
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 62
        end
        inherited cmbPrestador: TArtComboBox
          Width = 187
        end
        inherited edPresLocalidad: TEdit
          Width = 91
        end
        inherited edPresCPostal: TEdit
          Left = 462
        end
        inherited edPresTelefono: TEdit
          Left = 358
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 547
      Top = 0
      Width = 235
      Height = 42
      Anchors = [akTop, akRight]
      Caption = 'Auditor'
      TabOrder = 1
      DesignSize = (
        235
        42)
      inline fraAuditorFiltro: TfraCodigoDescripcion
        Left = 6
        Top = 14
        Width = 226
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 161
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 44
    Width = 784
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 780
      end>
    inherited ToolBar: TToolBar
      Width = 767
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 73
    Width = 784
    Height = 363
    OnDblClick = nil
    Columns = <
      item
        Expanded = False
        FieldName = 'AP_PRESTADOR'
        Title.Caption = 'ID Prestador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Prestador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AP_AUDITOR'
        Title.Caption = 'Cod. Auditor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'au_nombre'
        Title.Caption = 'Auditor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ap_fechaalta'
        Title.Caption = 'Fecha Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ap_usualta'
        Title.Caption = 'Usu Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ap_fechabaja'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ap_usubaja'
        Title.Caption = 'Usu Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Width = 631
    Height = 135
    BorderStyle = bsSingle
    inherited BevelAbm: TBevel
      Top = 99
      Width = 623
    end
    inherited btnAceptar: TButton
      Left = 473
      Top = 105
    end
    inherited btnCancelar: TButton
      Left = 551
      Top = 105
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 617
      Height = 42
      Caption = 'Prestador'
      TabOrder = 2
      inline fraPrestador: TfraPrestador
        Left = 3
        Top = 14
        Width = 606
        Height = 24
        VertScrollBar.Range = 49
        AutoScroll = False
        TabOrder = 0
        TabStop = True
        inherited lbCPostal: TLabel
          Left = 517
        end
        inherited lbTelefono: TLabel
          Left = 429
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 134
        end
        inherited cmbPrestador: TArtComboBox
          Width = 259
        end
        inherited edPresLocalidad: TEdit
          Width = 163
        end
        inherited edPresCPostal: TEdit
          Left = 534
        end
        inherited edPresTelefono: TEdit
          Left = 430
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 50
      Width = 617
      Height = 42
      Caption = 'Auditor'
      TabOrder = 3
      inline fraAuditor: TfraCodigoDescripcion
        Left = 6
        Top = 14
        Width = 608
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 540
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ap_id, ap_prestador, ap_auditor, au_nombre, ca_descripcio' +
        'n,'
      
        '       ap_fechaalta, ap_usualta, ap_fechamodif, ap_usumodif, ap_' +
        'fechabaja,'
      '       ap_usubaja'
      
        '  FROM SIN.sap_auditoresporprestador, art.mau_auditores, art.cpr' +
        '_prestador'
      
        ' WHERE au_auditor = ap_auditor AND ca_identificador = ap_prestad' +
        'or')
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
