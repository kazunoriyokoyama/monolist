class RankingController < ApplicationController

    def have
        
        @count_hash = Have.group(:item_id).limit(5).order('count_item_id DESC').count('item_id')
        ranked_ids = @count_hash.keys

        @items = Item.find(ranked_ids).sort_by{|item| ranked_ids.index(item.id)}
        # @have_ranking_items の中身は５つのItemのIDが入った配列
        # Have.group(:item_id).limit(5).order('count_item_id DESC').count('item_id')
        # keysの前までの値は{ 'ItemのID': 6←これはhaveされている数, 'ItemのID': 6←これはhaveされている数,...  }
        
        # items=[]
        # @have_ranking_items.each do |key,value|
        # @items = Item.find(key)
        # end
    end
    
    def want
        
        @count_hash = Want.group(:item_id).limit(5).order('count_item_id DESC').count('item_id')
        ranked_ids = @count_hash.keys

        @items = Item.find(ranked_ids).sort_by{|item| ranked_ids.index(item.id)}
        
        
    end
    
    
    
end