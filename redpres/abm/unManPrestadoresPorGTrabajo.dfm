inherited frmPrestadoresPorGtrabajo: TfrmPrestadoresPorGtrabajo
  Left = 550
  Top = 319
  Caption = 'Prestadores por Grupo de Trabajo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 125
    Visible = True
    object GroupBox3: TGroupBox
      Left = 4
      Top = 4
      Width = 613
      Height = 73
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Prestador'
      TabOrder = 0
      DesignSize = (
        613
        73)
      inline fraPrestadorFiltro: TfraPrestador
        Left = 8
        Top = 14
        Width = 597
        Height = 50
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited lbCPostal: TLabel
          Left = 525
        end
        inherited lbTelefono: TLabel
          Left = 437
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 142
        end
        inherited cmbPrestador: TArtComboBox
          Width = 267
        end
        inherited edPresLocalidad: TEdit
          Width = 171
        end
        inherited edPresCPostal: TEdit
          Left = 542
        end
        inherited edPresTelefono: TEdit
          Left = 438
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 4
      Top = 78
      Width = 613
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Grupo Trabajo'
      TabOrder = 1
      DesignSize = (
        613
        43)
      inline fraGTrabajoFiltro: TfraCodigoDescripcion
        Left = 12
        Top = 16
        Width = 593
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 528
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 125
    inherited ToolBar: TToolBar
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 154
    Height = 282
    Columns = <
      item
        Expanded = False
        FieldName = 'GP_NOMBRE'
        Title.Caption = 'Grupo Trabajo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_descripcion'
        Title.Caption = 'Prestador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pg_fechaalta'
        Title.Caption = 'Fecha Alta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pg_usualta'
        Title.Caption = 'Usu. Alta'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 64
    Top = 176
    Width = 585
    Height = 177
    inherited BevelAbm: TBevel
      Top = 141
      Width = 577
    end
    inherited btnAceptar: TButton
      Left = 427
      Top = 147
    end
    inherited btnCancelar: TButton
      Left = 505
      Top = 147
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 10
      Width = 569
      Height = 73
      Caption = 'Prestador'
      TabOrder = 2
      inline fraPrestador: TfraPrestador
        Left = 8
        Top = 14
        Width = 553
        Height = 50
        VertScrollBar.Range = 49
        AutoScroll = False
        TabOrder = 0
        inherited lbCPostal: TLabel
          Left = 481
        end
        inherited lbTelefono: TLabel
          Left = 393
        end
        inherited cmbPrestFantasia: TArtComboBox
          Width = 98
        end
        inherited cmbPrestador: TArtComboBox
          Width = 223
        end
        inherited edPresLocalidad: TEdit
          Width = 127
        end
        inherited edPresCPostal: TEdit
          Left = 498
        end
        inherited edPresTelefono: TEdit
          Left = 394
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 85
      Width = 569
      Height = 43
      Caption = 'Grupo Trabajo'
      TabOrder = 3
      inline fraGTrabajo: TfraCodigoDescripcion
        Left = 12
        Top = 16
        Width = 549
        Height = 23
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 484
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'select pg_id, pg_codgrupo, gp_nombre, pg_idprestador, ca_descrip' +
        'cion, pg_fechabaja,'
      '          PG_FECHAALTA, pg_usualta'
      ' from SIN.spg_prestadoresxgrupo, mgp_gtrabajo, cpr_prestador'
      
        ' where pg_codgrupo = gp_codigo and pg_idprestador = ca_identific' +
        'ador')
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
