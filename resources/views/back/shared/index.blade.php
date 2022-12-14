@extends('back.layout')

@section('css')
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href=" {{asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}} ">
  <link rel="stylesheet" href=" {{asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}} ">
  <style>
    a > * { pointer-events: none; }
  </style>
@endsection

@section('main') 
  {{ $dataTable->table(['class' => 'table table-bordered table-hover table-sm'], true) }}
@endsection

@section('js') 
  <script src=" {{asset('plugins/datatables/jquery.dataTables.min.js')}} "></script>
  <script src="{{asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}} "></script>
  <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script> 
  <script src="https://cdn.datatables.net/1.10.23/js/dataTables.bootstrap4.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

  <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
  <script src=" {{asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}} "></script>
  <script src=" {{asset('plugins/datatables-responsive/js/dataTables.responsive.min.js')}} "></script>
  <script src=" {{asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}} "></script>

  <script src="https://cdn.datatables.net/buttons/1.0.3/js/dataTables.buttons.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.0.3/css/buttons.dataTables.min.css">
    <script src="/vendor/datatables/buttons.server-side.js"></script>


  @if(config('app.locale') == 'fr')
    <script>
      (($, DataTable) => {
        $.extend(true, DataTable.defaults, {
          language: {
            "sEmptyTable":     "Aucune donnée disponible dans le tableau",
            "sInfo":           "Affichage des éléments _START_ à _END_ sur _TOTAL_ éléments",
            "sInfoEmpty":      "Affichage de l'élément 0 à 0 sur 0 élément",
            "sInfoFiltered":   "(filtré à partir de _MAX_ éléments au total)",
            "sInfoPostFix":    "",
            "sInfoThousands":  ",",
            "sLengthMenu":     "Afficher _MENU_ éléments",
            "sLoadingRecords": "Chargement...",
            "sProcessing":     "Traitement...",
            "sSearch":         "Rechercher :",
            "sZeroRecords":    "Aucun élément correspondant trouvé",
            "oPaginate": {
              "sFirst":    "Premier",
              "sLast":     "Dernier",
              "sNext":     "Suivant",
              "sPrevious": "Précédent"
            },
            "oAria": {
              "sSortAscending":  ": activer pour trier la colonne par ordre croissant",
              "sSortDescending": ": activer pour trier la colonne par ordre décroissant"
            },
            "select": {
              "rows": {
                "_": "%d lignes sélectionnées",
                "0": "Aucune ligne sélectionnée",
                "1": "1 ligne sélectionnée"
              }  
            }
          }
        });
      })(jQuery, jQuery.fn.dataTable);
    </script>
  @endif

  {{ $dataTable->scripts() }}

  <script>
    (() => {

        // Variables
        const headers = {
            'X-CSRF-TOKEN': '{{ csrf_token() }}', 
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
   
        // Delete 
        const deleteElement = async e => {              
            e.preventDefault();
            Swal.fire({
              title: e.target.dataset.name,
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#DD6B55',
              confirmButtonText: '@lang('Yes')',
              cancelButtonText: '@lang('No')',
              preConfirm: () => {
                  return fetch(e.target.getAttribute('href'), { 
                      method: 'DELETE',
                      headers: headers
                  })
                  .then(response => {
                      if (response.ok) {
                          e.target.parentNode.parentNode.remove();
                      } else {
                        Swal.fire({
                            icon: 'error',
                            title: '@lang('Whoops!')',
                            text: '@lang('Something went wrong!')'
                        });  
                      }
                  });
              }
            });
        }

         // Valid 
         const validElement = async e => {
            e.preventDefault();
            fetch(e.target.getAttribute('href'), { 
                method: 'PUT',
                headers: headers
            })
            .then(response => {
                if (response.ok) {
                    document.location.reload();             
                } else {
                  Swal.fire({
                      icon: 'error',
                      title: '@lang('Whoops!')',
                      text: '@lang('Something went wrong!')'
                  });  
                }
            });
        }

        // Listener wrapper
        const wrapper = (selector, type, callback, condition = 'true', capture = false) => {
            const element = document.querySelector(selector);
            if(element) {
                document.querySelector(selector).addEventListener(type, e => { 
                    if(eval(condition)) {
                        callback(e);
                    }
                }, capture);
            }
        };

        // Set listeners
        window.addEventListener('DOMContentLoaded', () => {
            wrapper('table', 'click', deleteElement, "e.target.matches('.btn-danger')");
            wrapper('table', 'click', validElement, `e.target.matches('[data-name="valid"]')`);
        });




    })()

  </script> 

@endsection