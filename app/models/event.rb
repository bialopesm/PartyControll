class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :date, presence: true
  validates :event_type, presence: true, inclusion: { in: ['Casamento', 'Aniversário', 'Aniversário de Casamento', 'Corporativo', 'Outro'] }
  validates :place, length: { maximum: 200 }, allow_blank: true
  validates :description, length: { maximum: 500 }, allow_blank: true
  validates :status, inclusion: { in: ['Planejamento', 'Confirmado', 'Em Andamento', 'Concluído', 'Cancelado'] }, allow_blank: true
  validates :supplier, length: { maximum: 1000 }, allow_blank: true

  # Ensure date is not in the past
  validate :date_cannot_be_in_the_past

  private

  def date_cannot_be_in_the_past
    if date.present? && date < Date.current
      errors.add(:date, "não pode estar no passado")
    end
  end
end
