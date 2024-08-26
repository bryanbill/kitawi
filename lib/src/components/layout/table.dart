import 'package:kitawi/kitawi.dart';

class Table extends Component {
  final TableSection? caption;
  final TableSection? thead;
  final TableSection? tbody;
  final TableSection? tfoot;

  Table({
    this.caption,
    this.thead,
    this.tbody,
    this.tfoot,
    super.id,
    super.className,
    super.style,
    super.attributes,
    super.tag = 'table',
  });

  @override
  HTMLElement render() {
    final table = super.render() as HTMLTableElement;
    if (caption != null) table.append(caption!.render());
    if (thead != null) table.append(thead!.render());
    if (tbody != null) table.append(tbody!.render());
    if (tfoot != null) table.append(tfoot!.render());

    return table;
  }
}

abstract class TableSection extends Component {
  TableSection({
    super.id,
    super.className,
    super.style,
    super.attributes,
    super.tag,
  });
}

class Caption extends TableSection {
  final Component? content;

  Caption(
      {this.content,
      super.id,
      super.className,
      super.style,
      super.attributes,
      super.tag = 'caption'});

  @override
  HTMLElement render() {
    final caption = super.render() as HTMLTableCaptionElement;
    if (content != null) caption.append(content!.render());

    return caption;
  }
}

class Thead extends TableSection {
  final List<TableRow> rows;

  Thead({
    this.rows = const [],
    super.id,
    super.className,
    super.style,
    super.attributes,
    super.tag = 'thead',
  });

  @override
  HTMLElement render() {
    final thead = super.render() as HTMLTableSectionElement;
    for (final row in rows) {
      thead.append(row.render());
    }

    return thead;
  }
}

class Tbody extends TableSection {
  final List<TableRow> rows;

  Tbody({
    this.rows = const [],
    super.id,
    super.className,
    super.style,
    super.attributes,
    super.tag = 'tbody',
  });

  @override
  HTMLElement render() {
    final tbody = super.render() as HTMLTableSectionElement;
    for (final row in rows) {
      tbody.append(row.render());
    }

    return tbody;
  }
}

class Tfoot extends TableSection {
  final List<TableRow> rows;

  Tfoot({
    this.rows = const [],
    super.id,
    super.className,
    super.style,
    super.attributes,
    super.tag = 'tfoot',
  });

  @override
  HTMLElement render() {
    final tfoot = super.render() as HTMLTableSectionElement;
    for (final row in rows) {
      tfoot.append(row.render());
    }

    return tfoot;
  }
}

class TableRow extends Component {
  final List<TableCell> cells;

  TableRow({
    this.cells = const [],
    super.id,
    super.className,
    super.style,
    super.attributes,
    super.tag = 'tr',
  });

  @override
  HTMLElement render() {
    final row = super.render() as HTMLTableRowElement;
    for (final cell in cells) {
      row.append(cell.render());
    }

    return row;
  }
}

enum Scope { col, colgroup, row, rowgroup }

class TableCell extends Component {
  final Component? content;
  final int? colSpan;
  final int? rowSpan;
  final Scope? scope;

  TableCell({
    this.content,
    this.colSpan,
    this.rowSpan,
    this.scope,
    super.id,
    super.className,
    super.style,
    super.attributes,
    super.tag = 'td',
  });

  @override
  HTMLElement render() {
    final cell = super.render() as HTMLTableCellElement;
    if (content != null) cell.append(content!.render());
    if (colSpan != null) cell.colSpan = colSpan!;
    if (rowSpan != null) cell.rowSpan = rowSpan!;

    if (scope != null) {
      switch (scope) {
        case Scope.col:
          cell.scope = 'col';
          break;
        case Scope.colgroup:
          cell.scope = 'colgroup';
          break;
        case Scope.row:
          cell.scope = 'row';
          break;
        case Scope.rowgroup:
          cell.scope = 'rowgroup';
          break;
        default:
          cell.scope = 'row';
          break;
      }
    }

    return cell;
  }
}
