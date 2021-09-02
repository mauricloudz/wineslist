class Wine < ApplicationRecord
    has_many :wine_strains, dependent: :destroy
    has_many :strains, through: :wine_strains, dependent: :destroy

    has_many :oenologist_scores, dependent: :destroy
    has_many :oenologists, through: :oenologist_scores

    has_and_belongs_to_many :oenologists


    def addStrainPercent(strains_percent)
        self.wine_strains.destroy_all
        strains_percent.each do |strainId, strainPercentage|
            if strainPercentage != ""
                self.wine_strains.create(strain_id: strainId, percentage: strainPercentage)
            end
        end
    end

    def getPercentByStrain(strainId)
        self.wine_strains.find_by(strain_id: strainId) ? self.wine_strains.find_by(strain_id: strainId).percentage : 0
    end
    
    def addScoreFromOenologist(scores)
        self.oenologist_scores.destroy_all
        scores.each do |o_id, o_score|
            if o_score != ""
                self.oenologist_scores.create(oenologist_id: o_id, score: o_score)
            end
        end
    end

    def getScoreFromOenologist(o_id)
        self.oenologist_scores.find_by(oenologist_id: o_id) ? self.oenologist_scores.find_by(oenologist_id: o_id).score : 0
    end
end
