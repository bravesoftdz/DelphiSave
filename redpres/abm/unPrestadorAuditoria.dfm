inherited frmPrestadorAuditoria: TfrmPrestadorAuditoria
  Width = 772
  Height = 488
  Caption = 'Prestadores que requieren auditor'#237'a del volante'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 762
    Height = 77
    Visible = True
    object gbPrestadorFiltro: TGroupBox
      Left = 2
      Top = 0
      Width = 759
      Height = 73
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Prestador'
      TabOrder = 0
      DesignSize = (
        759
        73)
      inline fraPrestadorFiltro: TfraPrestador
        Left = 4
        Top = 15
        Width = 749
        Height = 50
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited lbCPostal: TLabel
          Left = 677
        end
        inherited lbTelefono: TLabel
          Left = 589
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 294
        end
        inherited cmbPrestador: TArtComboBox
          Width = 419
        end
        inherited edPresLocalidad: TEdit
          Width = 323
        end
        inherited edPresCPostal: TEdit
          Left = 694
        end
        inherited edPresTelefono: TEdit
          Left = 590
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 77
    Width = 762
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 758
      end>
    inherited ToolBar: TToolBar
      Width = 745
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 106
    Width = 762
    Height = 353
    Columns = <
      item
        Expanded = False
        FieldName = 'ca_identificador'
        Title.Caption = 'ID Prestador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_clave'
        Title.Caption = 'CUIT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_descripcion'
        Title.Caption = 'Raz'#243'n Social'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_nombrefanta'
        Title.Caption = 'Nombre Fantas'#237'a'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pa_fechaalta'
        Title.Caption = 'Fecha Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pa_fechabaja'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 20
    Top = 188
    Width = 725
    Height = 129
    BorderStyle = bsSingle
    inherited BevelAbm: TBevel
      Top = 93
      Width = 717
    end
    inherited btnAceptar: TButton
      Left = 567
      Top = 99
    end
    inherited btnCancelar: TButton
      Left = 645
      Top = 99
    end
    object gbPrestador: TGroupBox
      Left = 10
      Top = 8
      Width = 709
      Height = 73
      Caption = 'Prestador'
      TabOrder = 2
      inline fraPrestador: TfraPrestador
        Left = 4
        Top = 15
        Width = 693
        Height = 50
        VertScrollBar.Range = 49
        AutoScroll = False
        TabOrder = 0
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ca_identificador, ca_clave, ca_descripcion, ca_nombrefant' +
        'a, '
      
        '               pa_fechabaja, pa_usubaja, pa_id, pa_idprestador, ' +
        'pa_fechaalta'
      '           FROM sin.spa_prestadoresauditoria, art.cpr_prestador'
      '           WHERE pa_idprestador = ca_identificador')
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
