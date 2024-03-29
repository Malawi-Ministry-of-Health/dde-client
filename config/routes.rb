Dde::Engine.routes.draw do
    get '/patients/find_by_npid', to: 'api/v1/dde#find_patients_by_npid'
    get '/patients/find_by_name_and_gender', to: 'api/v1/dde#find_patients_by_name_and_gender'
    get '/patients/import_by_doc_id', to: 'api/v1/dde#import_patients_by_doc_id'
    get '/patients/import_by_npid', to: 'api/v1/dde#import_patients_by_npid'
    get '/patients/match_by_demographics', to: 'api/v1/dde#match_patients_by_demographics'
    get '/patients/diff', to: 'api/v1/dde#patient_diff'
    get '/patients/refresh', to: 'api/v1/dde#refresh_patient'
    post '/patients/reassign_npid', to: 'api/v1/dde#reassign_patient_npid'
    post '/patients/merge', to: 'api/v1/dde#merge_patients'
    get '/patients/remaining_npids', to: 'api/v1/dde#remaining_npids'
    get '/rollback/merge_history', to: 'rollback#merge_history'
    post '/rollback/rollback_patient', to: 'rollback#rollback_patient'
end
