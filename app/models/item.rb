class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :image, :item_name, :description, presence: true
  validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: "を入力してください" }
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, message: 'が正しくありません  半角数字を入力してください' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'を300〜9,999,999の範囲で入力してください' }
end
