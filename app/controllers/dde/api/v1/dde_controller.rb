class Dde::Api::V1::DdeController < ApplicationController
  # GET /dde/patients
  def find_patients_by_npid
    npid = params.require(:npid)
    render json: service.find_patients_by_npid(npid)
  end

  def find_patients_by_name_and_gender
    given_name, family_name, gender = params.require(%i[given_name family_name gender])
    render json: service.find_patients_by_name_and_gender(given_name, family_name, gender)
  end

  def import_patients_by_npid
    npid = params.require(:npid)
    render json: service.import_patients_by_npid(npid)
  end

  def import_patients_by_doc_id
    doc_id = params.require(:doc_id)
    render json: service.import_patients_by_doc_id(doc_id)
  end

  def remaining_npids
    render json: service.remaining_npids
  end

  # GET /api/v1/dde/match
  #
  # Returns Dde patients matching demographics passed
  def match_patients_by_demographics
    render json: service.match_patients_by_demographics(
      given_name: match_params[:given_name],
      family_name: match_params[:family_name],
      gender: match_params[:gender],
      birthdate: match_params[:birthdate],
      home_traditional_authority: match_params[:home_traditional_authority],
      home_district: match_params[:home_district],
      home_village: match_params[:home_village]
    )
  end

  def reassign_patient_npid
    patient_ids = params.permit(:doc_id, :patient_id)
    render json: service.reassign_patient_npid(patient_ids)
  end

  def merge_patients
    primary_patient_ids = params.require(:primary)
    secondary_patient_ids_list = params.require(:secondary)

    render json: service.merge_patients(primary_patient_ids, secondary_patient_ids_list)
  end

  def patient_diff
    patient_id = params.require(:patient_id)
    diff = service.find_patient_updates(patient_id)

    render json: { diff: diff }
  end

  ##
  # Updates local patient with demographics in Dde.
  def refresh_patient
    patient_id = params.require(:patient_id)
    update_npid = params[:update_npid]&.casecmp?('true') || false

    patient = service.update_local_patient(Patient.find(patient_id), update_npid: update_npid)

    render json: patient
  end

  private

  MATCH_PARAMS = %i[given_name family_name gender birthdate home_village
                    home_traditional_authority home_district].freeze

  def match_params
    MATCH_PARAMS.each_with_object({}) do |param, params_hash|
      raise "param #{param} is required" if params[param].blank?

      params_hash[param] = params[param]
    end
  end

  def service
    Dde::DdeService.new(visit_type: visit_type)
  end

  def visit_type
    VisitType.find(params.require(:visit_type_id))
  end
end