<?php

namespace App\DataTables;

use App\Models\Softcode;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Services\DataTable;

class SoftcodesDataTable extends DataTable
{
    use DataTableTrait;

    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    public function dataTable($query)
    {
        return datatables()
            ->eloquent($query)
            ->editColumn('action', function ($softcode) {
                return $this->button(
                          'softcodes.edit', 
                          $softcode->id, 
                          'warning', 
                          __('Edit'), 
                          'edit'
                      ). $this->button(
                          'softcodes.destroy', 
                          $softcode->id, 
                          'danger', 
                          __('Delete'), 
                          'trash-alt', 
                          __('Really delete this link?')
                      );
            })
            ->rawColumns(['action']);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Models\Follow $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Softcode $model)
    {
        return $model->newQuery();
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
                    ->setTableId('softcodes-table')
                    ->columns($this->getColumns())
                    ->minifiedAjax()
                    ->dom('Blfrtip')
                    ->parameters([
                        'dom'          => 'Bfrtip',
                        'buttons'      => ['print', 'reload', 'export'],
                    ])
                    ->lengthMenu();
    }

    /**
     * Get columns.
     *
     * @return array
     */
    protected function getColumns()
    {
        return [
            Column::make('name')->title(__('Name')),
            Column::make('email')->title('Email'),
            Column::make('address')->title(__('Address')),
            Column::make('home_infos')->title('Home Title'),
            Column::make('home_infos_sub')->title(__('Info')),
            Column::computed('action')->title(__('Action'))->addClass('align-middle text-center'),
        ];
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filenam()
    {
        return 'Softcodes' . date('YmdHis');
    }
}
