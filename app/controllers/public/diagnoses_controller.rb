class Public::DiagnosesController < ApplicationController
  def new
  end

  def index
    diagnoses = Diagnosis.all
    selected_tag_ids = params[:answer]
    @mach_tag_count = 0
    tmp_mach_tag_count = 0
    @mached_diagnoses = []

    diagnoses.each do |diagnosis|
      tmp_mach_tag_count = 0
      diagnosis.tags.each do |tag|
        if selected_tag_ids&.include?(tag.id.to_s)
          tmp_mach_tag_count = tmp_mach_tag_count + 1
        end
      end

      if @mach_tag_count < tmp_mach_tag_count
        @mached_diagnoses = []
        @mached_diagnoses << diagnosis
        @mach_tag_count = tmp_mach_tag_count
      elsif @mach_tag_count == tmp_mach_tag_count
        @mached_diagnoses << diagnosis
      end
    end
  end
end
