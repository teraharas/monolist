class RankingController < ApplicationController

  def have
    item = Item.arel_table
    ownership = Ownership.arel_table
    
    join_condition = item.join(ownership, Arel::Nodes::OuterJoin).
              on(item[:id].eq(ownership[:item_id])).join_sources

    @have_items = Item.joins(join_condition).group(:id, :title, :large_image).
            select(item[:id], item[:title], item[:large_image], item[:id].sum.as('cnt')).
            where(ownership[:type].eq('Have')).
            order('cnt DESC').limit(10)
  end
  
  def want
    item = Item.arel_table
    ownership = Ownership.arel_table
    
    join_condition = item.join(ownership, Arel::Nodes::OuterJoin).
              on(item[:id].eq(ownership[:item_id])).join_sources

    @want_items = Item.joins(join_condition).group(:id, :title, :large_image).
            select(item[:id], item[:title], item[:large_image], item[:id].sum.as('cnt')).
            where(ownership[:type].eq('Want')).
            order('cnt DESC').limit(10)
  end

end