inherited frmDomicilio319: TfrmDomicilio319
  Left = 468
  Top = 293
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  Caption = 'Domicilio 319/59'
  ClientHeight = 523
  ClientWidth = 742
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 742
  end
  inherited CoolBar: TCoolBar
    Width = 742
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 738
      end>
    inherited ToolBar: TToolBar
      Width = 725
    end
  end
  inherited Grid: TArtDBGrid
    Width = 742
    Height = 449
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'DO_CALLE'
        Title.Caption = 'Calle/Ruta'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DO_NUMERO'
        Title.Caption = 'N'#186'/Km'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DO_LOCALIDAD'
        Title.Caption = 'Localidad'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DO_PROVINCIA'
        Title.Caption = 'Provincia'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DO_FECHARECEPCION'
        Title.Caption = 'Fecha Recepci'#243'n'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DO_FECHAINICIOOBRA'
        Title.Caption = 'Fecha Inicio Obra'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DO_FECHAFINOBRA'
        Title.Caption = 'Fecha Fin Obra'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DO_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 83
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 36
    Top = 140
    Width = 678
    inherited BevelAbm: TBevel
      Width = 670
    end
    object lbFRecepcion: TLabel [1]
      Left = 8
      Top = 79
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Recepci'#243'n:'
    end
    object lbFechaInicio: TLabel [2]
      Left = 235
      Top = 79
      Width = 88
      Height = 13
      Caption = 'Fecha Inicio Obra:'
    end
    object Label3: TLabel [3]
      Left = 455
      Top = 79
      Width = 92
      Height = 13
      Caption = 'Fecha Fin de Obra:'
    end
    object Label1: TLabel [4]
      Left = 6
      Top = 99
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Observaciones'
    end
    inherited btnAceptar: TButton
      Left = 520
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 598
      TabOrder = 6
    end
    object edFechaRecepcion: TDateComboBox
      Left = 120
      Top = 76
      Width = 88
      Height = 20
      TabOrder = 1
    end
    object edFechaInicioObra: TDateComboBox
      Left = 345
      Top = 76
      Width = 88
      Height = 20
      TabOrder = 2
    end
    object edFechaFinObra: TDateComboBox
      Left = 565
      Top = 76
      Width = 88
      Height = 20
      TabOrder = 3
    end
    object grbDomicilio: TGroupBox
      Left = 0
      Top = 0
      Width = 675
      Height = 70
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Domicilio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        675
        70)
      inline fraDomicilio319: TfraDomicilio
        Left = 4
        Top = 11
        Width = 668
        Height = 51
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        inherited lbCalle: TLabel
          Left = 20
          Caption = 'C&alle'
        end
        inherited lbNro: TLabel
          Left = 453
        end
        inherited lbPiso: TLabel
          Left = 525
        end
        inherited lbDto: TLabel
          Left = 601
        end
        inherited lbCPostal: TLabel
          Left = 2
          Caption = '&C.Postal'
        end
        inherited lbLocalidad: TLabel
          Caption = '&Localidad'
        end
        inherited lbProvincia: TLabel
          Left = 506
        end
        inherited cmbCalle: TArtComboBox
          Width = 368
        end
        inherited edNumero: TEdit
          Left = 475
        end
        inherited edPiso: TEdit
          Left = 551
        end
        inherited edDto: TEdit
          Left = 623
        end
        inherited cmbLocalidad: TArtComboBox
          Width = 236
        end
        inherited edProvincia: TEdit
          Left = 555
        end
        inherited btnBuscar: TButton
          Left = 418
        end
      end
    end
    object edObservaciones: TMemo
      Left = 8
      Top = 121
      Width = 664
      Height = 78
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 2000
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT do_id, do_idprogramaseguridad, do_calle, do_numero, do_pi' +
        'so,'
      
        '       do_departamento, do_cpostal, do_cpostala, do_localidad, d' +
        'o_provincia,'
      '       do_fecharecepcion, do_fechainicioobra, do_fechafinobra,'
      
        '       do_observaciones, do_fechaalta, do_usualta, do_fechamodif' +
        ', do_usumodif,'
      '       do_fechabaja, do_usubaja'
      '  FROM hys.hdo_domicilio319'
      ' WHERE do_idprogramaseguridad = :progseg')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'progseg'
        ParamType = ptInput
      end>
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
    Left = 80
    Top = 256
  end
end
