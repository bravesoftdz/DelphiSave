inherited frmConsPrueba: TfrmConsPrueba
  Left = 305
  Top = 141
  Caption = 'frmConsPrueba'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    object Label1: TLabel
      Left = 128
      Top = 8
      Width = 12
      Height = 13
      Caption = '>>'
    end
    object edDesde: TIntEdit
      Left = 4
      Top = 4
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edHasta: TIntEdit
      Left = 144
      Top = 4
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  inherited CoolBar: TCoolBar
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 440
      end>
    inherited ToolBar: TToolBar
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
    end
  end
  inherited CusomizableGrid1: TCusomizableGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'VO_VOLANTE'
        PickList.Strings = ()
        Title.Caption = 'Volante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_PRESTADOR'
        PickList.Strings = ()
        Title.Caption = 'Prestador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FACTURATIPO'
        PickList.Strings = ()
        Title.Caption = 'Factura Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FACTURAESTABLE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FACTURANRO'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHAFACTURA'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_MONTO'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_VENCIMIENTO'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_OBSERVACIONES'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_USUALTA'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHALTA'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_ESTADO'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_USUAPRO'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHAPRO'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_USUPAGO'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHAPAGO'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_USUMODIF'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHAMODIF'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_PORBONI'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FACPEN'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_NOTADEBITO'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_MONTOBONI'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_DESTINATARIO'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_DELEGACION'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_ORDENPAGO'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_CHEQUE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHACHEQUE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_TIPOPAGO'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHARECEPCION'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_DELEGACIONALTA'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_RETIENEINGBRUTOS'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_CHEQUENOMBRE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_AJUSTE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_FECHARECEPCION_CENTRAL'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VO_BONIFICACION'
        PickList.Strings = ()
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM SVO_VOLANTES')
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Volante'
        DataField = 'VO_VOLANTE'
      end
      item
        Title = 'Prestador'
        DataField = 'VO_PRESTADOR'
      end
      item
        Title = 'Factura Tipo'
        DataField = 'VO_FACTURATIPO'
      end
      item
        Title = 'VO_FACTURAESTABLE'
        DataField = 'VO_FACTURAESTABLE'
      end
      item
        Title = 'VO_FACTURANRO'
        DataField = 'VO_FACTURANRO'
      end
      item
        Title = 'VO_FECHAFACTURA'
        DataField = 'VO_FECHAFACTURA'
      end
      item
        Title = 'VO_MONTO'
        DataField = 'VO_MONTO'
      end
      item
        Title = 'VO_VENCIMIENTO'
        DataField = 'VO_VENCIMIENTO'
      end
      item
        Title = 'VO_OBSERVACIONES'
        DataField = 'VO_OBSERVACIONES'
      end
      item
        Title = 'VO_USUALTA'
        DataField = 'VO_USUALTA'
      end
      item
        Title = 'VO_FECHALTA'
        DataField = 'VO_FECHALTA'
      end
      item
        Title = 'VO_ESTADO'
        DataField = 'VO_ESTADO'
      end
      item
        Title = 'VO_USUAPRO'
        DataField = 'VO_USUAPRO'
      end
      item
        Title = 'VO_FECHAPRO'
        DataField = 'VO_FECHAPRO'
      end
      item
        Title = 'VO_USUPAGO'
        DataField = 'VO_USUPAGO'
      end
      item
        Title = 'VO_FECHAPAGO'
        DataField = 'VO_FECHAPAGO'
      end
      item
        Title = 'VO_USUMODIF'
        DataField = 'VO_USUMODIF'
      end
      item
        Title = 'VO_FECHAMODIF'
        DataField = 'VO_FECHAMODIF'
      end
      item
        Title = 'VO_PORBONI'
        DataField = 'VO_PORBONI'
      end
      item
        Title = 'VO_FACPEN'
        DataField = 'VO_FACPEN'
      end
      item
        Title = 'VO_NOTADEBITO'
        DataField = 'VO_NOTADEBITO'
      end
      item
        Title = 'VO_MONTOBONI'
        DataField = 'VO_MONTOBONI'
      end
      item
        Title = 'VO_DESTINATARIO'
        DataField = 'VO_DESTINATARIO'
      end
      item
        Title = 'VO_DELEGACION'
        DataField = 'VO_DELEGACION'
      end
      item
        Title = 'VO_ORDENPAGO'
        DataField = 'VO_ORDENPAGO'
      end
      item
        Title = 'VO_CHEQUE'
        DataField = 'VO_CHEQUE'
      end
      item
        Title = 'VO_FECHACHEQUE'
        DataField = 'VO_FECHACHEQUE'
      end
      item
        Title = 'VO_TIPOPAGO'
        DataField = 'VO_TIPOPAGO'
      end
      item
        Title = 'VO_FECHARECEPCION'
        DataField = 'VO_FECHARECEPCION'
      end
      item
        Title = 'VO_DELEGACIONALTA'
        DataField = 'VO_DELEGACIONALTA'
      end
      item
        Title = 'VO_RETIENEINGBRUTOS'
        DataField = 'VO_RETIENEINGBRUTOS'
      end
      item
        Title = 'VO_CHEQUENOMBRE'
        DataField = 'VO_CHEQUENOMBRE'
      end
      item
        Title = 'VO_AJUSTE'
        DataField = 'VO_AJUSTE'
      end
      item
        Title = 'VO_FECHARECEPCION_CENTRAL'
        DataField = 'VO_FECHARECEPCION_CENTRAL'
      end
      item
        Title = 'VO_BONIFICACION'
        DataField = 'VO_BONIFICACION'
      end>
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'VO_VOLANTE'
        Title = 'Volante'
      end
      item
        DataField = 'VO_PRESTADOR'
        Title = 'Prestador'
      end
      item
        DataField = 'VO_FACTURATIPO'
        Title = 'Factura Tipo'
      end
      item
        DataField = 'VO_FACTURAESTABLE'
        Title = 'VO_FACTURAESTABLE'
      end
      item
        DataField = 'VO_FACTURANRO'
        Title = 'VO_FACTURANRO'
      end
      item
        DataField = 'VO_FECHAFACTURA'
        Title = 'VO_FECHAFACTURA'
      end
      item
        DataField = 'VO_MONTO'
        Title = 'VO_MONTO'
      end
      item
        DataField = 'VO_VENCIMIENTO'
        Title = 'VO_VENCIMIENTO'
      end
      item
        DataField = 'VO_OBSERVACIONES'
        Title = 'VO_OBSERVACIONES'
      end
      item
        DataField = 'VO_USUALTA'
        Title = 'VO_USUALTA'
      end
      item
        DataField = 'VO_FECHALTA'
        Title = 'VO_FECHALTA'
      end
      item
        DataField = 'VO_ESTADO'
        Title = 'VO_ESTADO'
      end
      item
        DataField = 'VO_USUAPRO'
        Title = 'VO_USUAPRO'
      end
      item
        DataField = 'VO_FECHAPRO'
        Title = 'VO_FECHAPRO'
      end
      item
        DataField = 'VO_USUPAGO'
        Title = 'VO_USUPAGO'
      end
      item
        DataField = 'VO_FECHAPAGO'
        Title = 'VO_FECHAPAGO'
      end
      item
        DataField = 'VO_USUMODIF'
        Title = 'VO_USUMODIF'
      end
      item
        DataField = 'VO_FECHAMODIF'
        Title = 'VO_FECHAMODIF'
      end
      item
        DataField = 'VO_PORBONI'
        Title = 'VO_PORBONI'
      end
      item
        DataField = 'VO_FACPEN'
        Title = 'VO_FACPEN'
      end
      item
        DataField = 'VO_NOTADEBITO'
        Title = 'VO_NOTADEBITO'
      end
      item
        DataField = 'VO_MONTOBONI'
        Title = 'VO_MONTOBONI'
      end
      item
        DataField = 'VO_DESTINATARIO'
        Title = 'VO_DESTINATARIO'
      end
      item
        DataField = 'VO_DELEGACION'
        Title = 'VO_DELEGACION'
      end
      item
        DataField = 'VO_ORDENPAGO'
        Title = 'VO_ORDENPAGO'
      end
      item
        DataField = 'VO_CHEQUE'
        Title = 'VO_CHEQUE'
      end
      item
        DataField = 'VO_FECHACHEQUE'
        Title = 'VO_FECHACHEQUE'
      end
      item
        DataField = 'VO_TIPOPAGO'
        Title = 'VO_TIPOPAGO'
      end
      item
        DataField = 'VO_FECHARECEPCION'
        Title = 'VO_FECHARECEPCION'
      end
      item
        DataField = 'VO_DELEGACIONALTA'
        Title = 'VO_DELEGACIONALTA'
      end
      item
        DataField = 'VO_RETIENEINGBRUTOS'
        Title = 'VO_RETIENEINGBRUTOS'
      end
      item
        DataField = 'VO_CHEQUENOMBRE'
        Title = 'VO_CHEQUENOMBRE'
      end
      item
        DataField = 'VO_AJUSTE'
        Title = 'VO_AJUSTE'
      end
      item
        DataField = 'VO_FECHARECEPCION_CENTRAL'
        Title = 'VO_FECHARECEPCION_CENTRAL'
      end
      item
        DataField = 'VO_BONIFICACION'
        Title = 'VO_BONIFICACION'
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Volante'
        DataField = 'VO_VOLANTE'
        MaxLength = 10
      end
      item
        Title = 'Prestador'
        DataField = 'VO_PRESTADOR'
        MaxLength = 10
      end
      item
        Title = 'Factura Tipo'
        DataField = 'VO_FACTURATIPO'
        MaxLength = 1
      end
      item
        Title = 'VO_FACTURAESTABLE'
        DataField = 'VO_FACTURAESTABLE'
        MaxLength = 4
      end
      item
        Title = 'VO_FACTURANRO'
        DataField = 'VO_FACTURANRO'
        MaxLength = 8
      end
      item
        Title = 'VO_FECHAFACTURA'
        DataField = 'VO_FECHAFACTURA'
        MaxLength = 18
      end
      item
        Title = 'VO_MONTO'
        DataField = 'VO_MONTO'
        MaxLength = 10
      end
      item
        Title = 'VO_VENCIMIENTO'
        DataField = 'VO_VENCIMIENTO'
        MaxLength = 18
      end
      item
        Title = 'VO_OBSERVACIONES'
        DataField = 'VO_OBSERVACIONES'
        MaxLength = 250
      end
      item
        Title = 'VO_USUALTA'
        DataField = 'VO_USUALTA'
        MaxLength = 20
      end
      item
        Title = 'VO_FECHALTA'
        DataField = 'VO_FECHALTA'
        MaxLength = 18
      end
      item
        Title = 'VO_ESTADO'
        DataField = 'VO_ESTADO'
        MaxLength = 2
      end
      item
        Title = 'VO_USUAPRO'
        DataField = 'VO_USUAPRO'
        MaxLength = 20
      end
      item
        Title = 'VO_FECHAPRO'
        DataField = 'VO_FECHAPRO'
        MaxLength = 18
      end
      item
        Title = 'VO_USUPAGO'
        DataField = 'VO_USUPAGO'
        MaxLength = 20
      end
      item
        Title = 'VO_FECHAPAGO'
        DataField = 'VO_FECHAPAGO'
        MaxLength = 18
      end
      item
        Title = 'VO_USUMODIF'
        DataField = 'VO_USUMODIF'
        MaxLength = 20
      end
      item
        Title = 'VO_FECHAMODIF'
        DataField = 'VO_FECHAMODIF'
        MaxLength = 18
      end
      item
        Title = 'VO_PORBONI'
        DataField = 'VO_PORBONI'
        MaxLength = 10
      end
      item
        Title = 'VO_FACPEN'
        DataField = 'VO_FACPEN'
        MaxLength = 10
      end
      item
        Title = 'VO_NOTADEBITO'
        DataField = 'VO_NOTADEBITO'
        MaxLength = 10
      end
      item
        Title = 'VO_MONTOBONI'
        DataField = 'VO_MONTOBONI'
        MaxLength = 10
      end
      item
        Title = 'VO_DESTINATARIO'
        DataField = 'VO_DESTINATARIO'
        MaxLength = 1
      end
      item
        Title = 'VO_DELEGACION'
        DataField = 'VO_DELEGACION'
        MaxLength = 3
      end
      item
        Title = 'VO_ORDENPAGO'
        DataField = 'VO_ORDENPAGO'
        MaxLength = 30
      end
      item
        Title = 'VO_CHEQUE'
        DataField = 'VO_CHEQUE'
        MaxLength = 10
      end
      item
        Title = 'VO_FECHACHEQUE'
        DataField = 'VO_FECHACHEQUE'
        MaxLength = 18
      end
      item
        Title = 'VO_TIPOPAGO'
        DataField = 'VO_TIPOPAGO'
        MaxLength = 10
      end
      item
        Title = 'VO_FECHARECEPCION'
        DataField = 'VO_FECHARECEPCION'
        MaxLength = 18
      end
      item
        Title = 'VO_DELEGACIONALTA'
        DataField = 'VO_DELEGACIONALTA'
        MaxLength = 3
      end
      item
        Title = 'VO_RETIENEINGBRUTOS'
        DataField = 'VO_RETIENEINGBRUTOS'
        MaxLength = 1
      end
      item
        Title = 'VO_CHEQUENOMBRE'
        DataField = 'VO_CHEQUENOMBRE'
        MaxLength = 100
      end
      item
        Title = 'VO_AJUSTE'
        DataField = 'VO_AJUSTE'
        MaxLength = 10
      end
      item
        Title = 'VO_FECHARECEPCION_CENTRAL'
        DataField = 'VO_FECHARECEPCION_CENTRAL'
        MaxLength = 18
      end
      item
        Title = 'VO_BONIFICACION'
        DataField = 'VO_BONIFICACION'
        MaxLength = 10
      end>
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
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
