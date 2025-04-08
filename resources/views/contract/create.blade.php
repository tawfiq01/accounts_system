{{ Form::open(array('url' => 'contract')) }}
<div class="modal-body">
    <div class="row">
        <div class="form-group col-md-12">
            {{ Form::label('subject', __('Subject'),['class' => 'col-form-label']) }}
            {{ Form::text('subject', '', array('class' => 'form-control','required'=>'required')) }}
        </div>
        <div class="form-group col-md-12">
            {{ Form::label('customer', __('Customer'),['class' => 'col-form-label']) }}
            {{ Form::select('customer', $customers,null, array('class' => 'form-control ','required'=>'required')) }}
        </div>
        
        <div class="form-group col-md-6">
            {{ Form::label('type', __('Contract Type'),['class' => 'col-form-label']) }}
            {{ Form::select('type', $contractTypes,null, array('class' => 'form-control ','required'=>'required')) }}
        </div>
        <div class="form-group col-md-6">
            {{ Form::label('value', __('Contract Value'),['class' => 'col-form-label']) }}
            {{ Form::number('value', '', array('class' => 'form-control','required'=>'required','stage'=>'0.01')) }}
        </div>
        <div class="form-group col-md-6">
            {{ Form::label('start_date', __('Start Date'),['class' => 'col-form-label']) }}
            {{ Form::date('start_date', '', array('class' => 'form-control','required'=>'required')) }}
        </div>
        <div class="form-group col-md-6">
            {{ Form::label('end_date', __('End Date'),['class' => 'col-form-label']) }}
            {{ Form::date('end_date', '', array('class' => 'form-control','required'=>'required')) }}
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12">
            {{ Form::label('description', __('Description'),['class' => 'col-form-label']) }}
            {!! Form::textarea('description', null, ['class'=>'form-control','rows'=>'3']) !!}
        </div>
    </div>
    {{-- <div class="col-md-12 form-group">
        <label class="form-label">{{__('Status')}}</label>
        <div class="d-flex radio-check">
            <div class="custom-control custom-radio custom-control-inline m-1">
                <input type="radio" id="start" name="status" value="start" class="form-check-input" checked>
                <label class="form-check-labe" for="start">{{__('Start')}}</label>
            </div>
            <div class="custom-control custom-radio custom-control-inline m-1">
                <input type="radio" id="close" name="status" value="close" class="form-check-input">
                <label class="form-check-labe" for="close">{{__('Close')}}</label>
            </div>
        </div>
    </div> --}}
    
</div>
<div class="modal-footer pr-0">
        <button type="button" class="btn  btn-light" data-bs-dismiss="modal">{{ __('Close') }}</button>
        {{Form::submit(__('Create'),array('class'=>'btn  btn-primary'))}}
    </div>
{{ Form::close() }}



<script src="{{asset('assets/js/plugins/choices.min.js')}}"></script>
<script>
    if ($(".multi-select").length > 0) {
              $( $(".multi-select") ).each(function( index,element ) {
                  var id = $(element).attr('id');
                     var multipleCancelButton = new Choices(
                          '#'+id, {
                              removeItemButton: true,
                          }
                      );
              });
         }
  </script>