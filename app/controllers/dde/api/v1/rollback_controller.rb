# frozen_string_literal: true

# controller for managing merge rollback
class Api::V1::RollbackController < ApplicationController
  def merge_history
    identifier = params.require(:identifier)
    render json: merge_service.get_patient_audit(identifier), status: :ok
  end

  def rollback_patient
    patient_id = params.require(:patient_id)
    visit_type_id = params.require(:visit_type_id)
    render json: rollback_service.rollback_merged_patient(patient_id, visit_type_id), status: :ok
  end

  private

  def merge_service
    MergeAuditService.new
  end

  def rollback_service
    RollbackService.new
  end
end
