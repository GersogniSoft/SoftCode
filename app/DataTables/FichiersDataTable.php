<?php

namespace App\DataTables;

use App\Models\Category;
use App\Models\Fichier;
use Illuminate\Database\Eloquent\Builder as QueryBuilder;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Html\Builder as HtmlBuilder;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;

class FichiersDataTable extends DataTable
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
            ->editColumn('posts_count', function ($fichier) {
                return $this->badge($fichier->posts_count, 'secondary');
            })
            ->editColumn('action', function ($fichier) {
                return $this->button(
                          'fichiers.edit', 
                          $fichier->id, 
                          'warning', 
                          __('Edit'), 
                          'edit'
                      ). $this->button(
                          'fichiers.destroy', 
                          $fichier->id, 
                          'danger', 
                          __('Delete'), 
                          'trash-alt', 
                          __('Really delete this file?')
                      );
            })
            ->rawColumns(['posts_count', 'action']);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Models\file $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Fichier $fichier)
    {
        return $fichier->withCount('posts');
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
                    ->setTableId('fichiers-table')
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
            Column::make('title')->title(__('Title')),
            Column::make('slug')->title(__('Slug')),
            Column::computed('posts_count')->title(__('Posts'))->addClass('text-center align-middle'),
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
        return 'Fichiers' . date('YmdHis');
    }
}
