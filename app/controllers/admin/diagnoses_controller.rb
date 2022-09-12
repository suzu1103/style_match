class Admin::DiagnosesController < ApplicationController
  def index
    @diagnoses = Diagnosis.all
    @diagnosis = Diagnosis.new
  end

  def create
    @diagnosis = Diagnosis.new(diagnosis_params)
    if @diagnosis.save
      redirect_to admin_diagnoses_path
    else
      @diagnoses = Diagnosis.all
      render :index
    end
  end

  def edit
    @diagnosis = Diagnosis.find(params[:id])
  end

  def update
    diagnosis = Diagnosis.find(params[:id])
    if diagnosis.update(diagnosis_params)
      redirect_to admin_diagnoses_path
    else
      render :edit
    end
  end
  
  def destroy
    diagnosis = Diagnosis.find(params[:id])
    diagnosis.destroy
    redirect_to admin_diagnoses_path
  end


  def diagnosis_params
    params.require(:diagnosis).permit(:name, diagnosis_tag_ids: [])
  end
end
