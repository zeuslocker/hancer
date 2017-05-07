class Input < ApplicationRecord
  belongs_to :client, optional: true
  has_many :input_values, dependent: :destroy
  scope :without_default, -> { where.not('name=? OR name=? OR name=?', 'points', 'fraktnr', 'kommentar') }
  scope :fraktnr, -> { find_by(name: I18n.t('client.form.fraktnr_low_case')) }
  scope :points, -> { find_by(name: I18n.t('client.form.points_for_form')) }
end
