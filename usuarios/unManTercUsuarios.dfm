inherited frmManTercUsuarios: TfrmManTercUsuarios
  Caption = 'Usuarios de Tercerizadoras'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 49
    Visible = True
    ExplicitHeight = 49
    object GroupBox4: TGroupBox
      Left = 4
      Top = 2
      Width = 616
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tercerizadora'
      TabOrder = 0
      DesignSize = (
        616
        44)
      inline fraTercerizadoraFiltro: TfraCodigoDescripcion
        Left = 5
        Top = 15
        Width = 606
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 15
        ExplicitWidth = 335
        inherited cmbDescripcion: TArtComboBox
          Width = 541
          ExplicitWidth = 270
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 49
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 615
      end>
    inherited ToolBar: TToolBar
      Left = 9
      Width = 608
      ExplicitLeft = 9
      ExplicitWidth = 608
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 78
    Height = 358
    Columns = <
      item
        Expanded = False
        FieldName = 'ut_idtercerizadora'
        Title.Caption = 'Id. Terceriz.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tm_nombre'
        Title.Caption = 'Emp. Tercerizadora'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ut_usuario'
        Title.Caption = 'Usuario'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'se_nombre'
        Title.Caption = 'Nombre'
        Width = 180
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 121
    Top = 152
    Width = 410
    Height = 140
    BorderStyle = bsDialog
    ExplicitLeft = 121
    ExplicitTop = 152
    ExplicitWidth = 410
    ExplicitHeight = 140
    inherited BevelAbm: TBevel
      Top = 104
      Width = 402
      ExplicitTop = 104
      ExplicitWidth = 402
    end
    inherited btnAceptar: TButton
      Left = 252
      Top = 110
      TabOrder = 2
      ExplicitLeft = 252
      ExplicitTop = 110
    end
    inherited btnCancelar: TButton
      Left = 330
      Top = 110
      TabOrder = 3
      ExplicitLeft = 330
      ExplicitTop = 110
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 2
      Width = 401
      Height = 47
      Caption = 'Usuario'
      TabOrder = 0
      inline fraUsuario: TfraUsuario
        Left = 8
        Top = 17
        Width = 385
        Height = 21
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 17
        ExplicitWidth = 385
        inherited cmbDescripcion: TArtComboBox
          Width = 301
          ExplicitWidth = 301
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 52
      Width = 401
      Height = 47
      Caption = 'Tercerizadora'
      TabOrder = 1
      inline fraTercerizadora: TfraCodigoDescripcion
        Left = 5
        Top = 17
        Width = 389
        Height = 23
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 17
        ExplicitWidth = 389
        inherited cmbDescripcion: TArtComboBox
          Width = 324
          ExplicitWidth = 324
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'select ut_id, ut_idtercerizadora, tm_nombre, ut_usuario, se_nomb' +
        're, ut_fechabaja, ut_usubaja,'
      '       ut_fechaalta, ut_usualta'
      
        '  from amed.mut_usuario_tercerizadora, AMED.mtm_tercerizadora_me' +
        'dica, art.use_usuarios'
      ' where ut_idtercerizadora = tm_id'
      '   and se_usuario(+) = ut_usuario '
      '   and ut_fechabaja is null')
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
      end
      item
        Key = 0
      end>
  end
end
