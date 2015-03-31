class ResultsController < ApplicationController
  http_basic_authenticate_with name: "shunter", password: "derpderp", except: [:show]
  
  class Resulta
    include ActiveModel::Model
    
    attr_reader :name, :costinusd
    attr_writer :name, :costinusd
  end
  
  def index
    @results = []
    
    costs = Trip.all
    
    costs.each do |cost|
      @results.insert(0, cost)
    end
    
    #@result.name = "Bob"
  end
  
  def show
    #@trip = Trip.find(params[:id])
    
    costs = Trip.find(params[:id])
    @result = Result.new
    @result.name = costs.name
    @result.costinusd = costs.costinusd
    @result.aacostpts = costs.aacostpts
    @result.aacostusd = costs.aacostusd
    @result.bacostpts = costs.bacostpts
    @result.bacostusd = costs.bacostusd
    @result.uacostpts = costs.uacostpts
    @result.uacostusd = costs.uacostusd
    @result.dlcostpts = costs.dlcostpts
    @result.dlcostusd = costs.dlcostusd
    @result.ascostpts = costs.ascostpts
    @result.ascostusd = costs.ascostusd
    @result.nkcostpts = costs.nkcostpts
    @result.nkcostusd = costs.nkcostusd
    @result.sqcostpts = costs.sqcostpts
    @result.sqcostusd = costs.sqcostusd
    @result.lacostpts = costs.lacostpts
    @result.lacostusd = costs.lacostusd
    @result.accostpts = costs.accostpts
    @result.accostusd = costs.accostusd
    @result.cxcostpts = costs.cxcostpts
    @result.cxcostusd = costs.cxcostusd
    @result.brcostpts = costs.brcostpts
    @result.brcostusd = costs.brcostusd
    @result.eycostpts = costs.eycostpts
    @result.eycostusd = costs.eycostusd
    @result.afcostpts = costs.afcostpts
    @result.afcostusd = costs.afcostusd
    @result.gacostpts = costs.gacostpts
    @result.gacostusd = costs.gacostusd
    @result.mhcostpts = costs.mhcostpts
    @result.mhcostusd = costs.mhcostusd
    @result.qfcostpts = costs.qfcostpts
    @result.qfcostusd = costs.qfcostusd
    @result.qrcostpts = costs.qrcostpts
    @result.qrcostusd = costs.qrcostusd
    @result.tgcostpts = costs.tgcostpts
    @result.tgcostusd = costs.tgcostusd
    @result.vscostpts = costs.vscostpts
    @result.vscostusd = costs.vscostusd
    @result.azcostpts = costs.azcostpts
    @result.azcostusd = costs.azcostusd
    @result.nhcostpts = costs.nhcostpts
    @result.nhcostusd = costs.nhcostusd
    @result.amcostpts = costs.amcostpts
    @result.amcostusd = costs.amcostusd
    @result.lycostpts = costs.lycostpts
    @result.lycostusd = costs.lycostusd
    @result.hacostpts = costs.hacostpts
    @result.hacostusd = costs.hacostusd
    @result.ibcostpts = costs.ibcostpts
    @result.ibcostusd = costs.ibcostusd
    @result.vxcostpts = costs.vxcostpts
    @result.vxcostusd = costs.vxcostusd
    @result.abcostpts = costs.abcostpts
    @result.abcostusd = costs.abcostusd
    @result.cacostpts = costs.cacostpts
    @result.cacostusd = costs.cacostusd
    @result.nzcostpts = costs.nzcostpts
    @result.nzcostusd = costs.nzcostusd
    @result.ozcostpts = costs.ozcostpts
    @result.ozcostusd = costs.ozcostusd
    @result.mucostpts = costs.mucostpts
    @result.mucostusd = costs.mucostusd
    @result.czcostpts = costs.czcostpts
    @result.czcostusd = costs.czcostusd
    @result.ekcostpts = costs.ekcostpts
    @result.ekcostusd = costs.ekcostusd
    @result.g3costpts = costs.g3costpts
    @result.g3costusd = costs.g3costusd
    @result.hucostpts = costs.hucostpts
    @result.hucostusd = costs.hucostusd
    @result.jlcostpts = costs.jlcostpts
    @result.jlcostusd = costs.jlcostusd
    @result.lhcostpts = costs.lhcostpts
    @result.lhcostusd = costs.lhcostusd
    @result.svcostpts = costs.svcostpts
    @result.svcostusd = costs.svcostusd
    @result.vacostpts = costs.vacostpts
    @result.vacostusd = costs.vacostusd
    
    #puts costs.aacostpts
    
    cards = Creditcard.all
    #cards = Creditcard.find(params[:id])
    
    #cards.each do |cc|
    #@result.name = cc.name
    #@result.issuer = cc.issuer
    #@result.points_program = cc.points_program
    #@result.spend_bonus = cc.spend_bonus
    #end
    
    costs = Trip.find(params[:id])
    rates = Rate.all
    cards = Creditcard.all
    
    #debug_string = ""
    @debug_string = ""
    @result.arrayofcards = []
    
    rates.each do |rate|
      cards.each do |card|
        @debug_string << card.name
        if card.points_program == rate.transferringprogram
          #@result.name << card.points_program + " = " + rate.transferringprogram
          if @result.arrayofcards == nil
            @result.arrayofcards = []
            #debug_string = "Empty. "
          end
          
          #debug_string = "Adding card."
          #@debug_string = card.name
          temparray = []
          
          case rate.transfereeprogram
          when "american"
            if @result.aacostpts.nil?
              percentage = 0
              #debug_string = "Percentage to 0."
              @debug_string << " nil."
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.aacostpts * 100
            end
            
            miles_required = @result.aacostpts
            if @result.aacostusd.nil?
              copay = 0
            else
              copay = @result.aacostusd
            end
            
            temparray = [card, rate, "American", percentage, miles_required, copay]
            #debug_string = "american"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "ba"
            if @result.bacostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.bacostpts * 100
            end
            
            miles_required = @result.bacostpts
            if @result.bacostusd.nil?
              copay = 0
            else
              copay = @result.bacostusd
            end
            
            temparray = [card, rate, "BA", percentage, miles_required, copay]
            #debug_string = "ba"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "united"
            if @result.uacostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.uacostpts * 100
            end
            
            miles_required = @result.uacostpts
            if @result.uacostusd.nil?
              copay = 0
            else
              copay = @result.uacostusd
            end
            
            temparray = [card, rate, "United", percentage, miles_required, copay]
            #debug_string = "united"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "delta"
            if @result.dlcostpts.nil?
              percentage = 0
              @result.name << "Delta cost is nil."
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.dlcostpts * 100
            end
            
            miles_required = @result.dlcostpts
            if @result.dlcostusd.nil?
              copay = 0
            else
              copay = @result.dlcostusd
            end
            
            temparray = [card, rate, "Delta", percentage, miles_required, copay]
            #debug_string = "dl"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "alaska"
            if @result.ascostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.ascostpts * 100
            end
            
            miles_required = @result.ascostpts
            if @result.ascostusd.nil?
              copay = 0
            else
              copay = @result.ascostusd
            end
            
            temparray = [card, rate, "Alaska", percentage, miles_required, copay]
            #debug_string = "as"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "spirit"
            if @result.nkcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.nkcostpts * 100
            end
            
            miles_required = @result.nkcostpts
            if @result.nkcostusd.nil?
              copay = 0
            else
              copay = @result.nkcostusd
            end
            
            temparray = [card, rate, "Spirit", percentage, miles_required, copay]
            #debug_string = "nk"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "singapore"
            if @result.sqcostpts.nil?
              percentage = 0
              @debug_string << " Singapore nil."
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.sqcostpts * 100
            end
            
            miles_required = @result.sqcostpts
            if @result.sqcostusd.nil?
              copay = 0
            else
              copay = @result.sqcostusd
            end
            
            temparray = [card, rate, "Singapore", percentage, miles_required, copay]
            #debug_string = "sq"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "lan"
            if @result.lacostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.lacostpts * 100
            end
            
            miles_required = @result.lacostpts
            if @result.lacostusd.nil?
              copay = 0
            else
              copay = @result.lacostusd
            end
            
            temparray = [card, rate, "LAN", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "aircanada"
            if @result.accostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.accostpts * 100
            end
            
            miles_required = @result.accostpts
            if @result.accostusd.nil?
              copay = 0
            else
              copay = @result.accostusd
            end
            
            temparray = [card, rate, "Air Canada", percentage, miles_required, copay]
            #debug_string = "ac"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "cathay_pacific"
            if @result.cxcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.cxcostpts * 100
            end
            
            miles_required = @result.cxcostpts
            if @result.cxcostusd.nil?
              copay = 0
            else
              copay = @result.cxcostusd
            end
            
            temparray = [card, rate, "Cathay Pacific", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "eva"
            if @result.brcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.brcostpts * 100
            end
            
            miles_required = @result.brcostpts
            if @result.brcostusd.nil?
              copay = 0
            else
              copay = @result.brcostusd
            end
            
            temparray = [card, rate, "EVA", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "etihad"
            if @result.eycostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.eycostpts * 100
            end
            
            miles_required = @result.eycostpts
            if @result.eycostusd.nil?
              copay = 0
            else
              copay = @result.eycostusd
            end
            
            temparray = [card, rate, "Etihad", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "flying_blue"
            if @result.afcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.afcostpts * 100
            end
            
            miles_required = @result.afcostpts
            if @result.afcostusd.nil?
              copay = 0
            else
              copay = @result.afcostusd
            end
            
            temparray = [card, rate, "Flying Blue (Air France/KLM)", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "garuda_indonesia"
            if @result.gacostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.gacostpts * 100
            end
            
            miles_required = @result.gacostpts
            if @result.gacostusd.nil?
              copay = 0
            else
              copay = @result.gacostusd
            end
            
            temparray = [card, rate, "Garuda Indonesia", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "malaysia"
            if @result.mhcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.mhcostpts * 100
            end
            
            miles_required = @result.mhcostpts
            if @result.mhcostusd.nil?
              copay = 0
            else
              copay = @result.mhcostusd
            end
            
            temparray = [card, rate, "Malaysia Air", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "qantas"
            if @result.qfcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.qfcostpts * 100
            end
            
            miles_required = @result.qfcostpts
            if @result.qfcostusd.nil?
              copay = 0
            else
              copay = @result.qfcostusd
            end
            
            temparray = [card, rate, "Qantas", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "qatar"
            if @result.qrcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.qrcostpts * 100
            end
            
            miles_required = @result.qrcostpts
            if @result.qrcostusd.nil?
              copay = 0
            else
              copay = @result.qrcostusd
            end
            
            temparray = [card, rate, "Qatar", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "thai"
            if @result.tgcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.tgcostpts * 100
            end
            
            miles_required = @result.tgcostpts
            if @result.tgcostusd.nil?
              copay = 0
            else
              copay = @result.tgcostusd
            end
            
            temparray = [card, rate, "Thai Airways", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "virgin_atlantic"
            if @result.vscostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.vscostpts * 100
            end
            
            miles_required = @result.vscostpts
            if @result.vscostusd.nil?
              copay = 0
            else
              copay = @result.vscostusd
            end
            
            temparray = [card, rate, "Virgin Atlantic", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "alitalia"
            if @result.azcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.azcostpts * 100
            end
            
            miles_required = @result.azcostpts
            if @result.azcostusd.nil?
              copay = 0
            else
              copay = @result.azcostusd
            end
            
            temparray = [card, rate, "Alitalia", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "ana"
            if @result.nhcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.nhcostpts * 100
            end
            
            miles_required = @result.nhcostpts
            if @result.nhcostusd.nil?
              copay = 0
            else
              copay = @result.nhcostusd
            end
            
            temparray = [card, rate, "ANA", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "aeromexico"
            if @result.amcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.amcostpts * 100
            end
            
            miles_required = @result.amcostpts
            if @result.amcostusd.nil?
              copay = 0
            else
              copay = @result.amcostusd
            end
            
            temparray = [card, rate, "AeroMexico", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "el_al"
            if @result.lycostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.lycostpts * 100
            end
            
            miles_required = @result.lycostpts
            if @result.lycostusd.nil?
              copay = 0
            else
              copay = @result.lycostusd
            end
            
            temparray = [card, rate, "El Al", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "hawaiian"
            if @result.hacostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.hacostpts * 100
            end
            
            miles_required = @result.hacostpts
            if @result.hacostusd.nil?
              copay = 0
            else
              copay = @result.hacostusd
            end
            
            temparray = [card, rate, "Hawaiian Airlines", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "iberia"
            if @result.ibcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.ibcostpts * 100
            end
            
            miles_required = @result.ibcostpts
            if @result.ibcostusd.nil?
              copay = 0
            else
              copay = @result.ibcostusd
            end
            
            temparray = [card, rate, "Iberia", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "virgin_america"
            if @result.vxcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.vxcostpts * 100
            end
            
            miles_required = @result.vxcostpts
            if @result.vxcostusd.nil?
              copay = 0
            else
              copay = @result.vxcostusd
            end
            
            temparray = [card, rate, "Virgin America", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "airberlin"
            if @result.abcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.abcostpts * 100
            end
            
            miles_required = @result.abcostpts
            if @result.abcostusd.nil?
              copay = 0
            else
              copay = @result.abcostusd
            end
            
            temparray = [card, rate, "Air Berlin", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "airchina"
            if @result.cacostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.cacostpts * 100
            end
            
            miles_required = @result.cacostpts
            if @result.cacostusd.nil?
              copay = 0
            else
              copay = @result.cacostusd
            end
            
            temparray = [card, rate, "Air China", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "air_new_zealand"
            if @result.nzcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.nzcostpts * 100
            end
            
            miles_required = @result.nzcostpts
            if @result.nzcostusd.nil?
              copay = 0
            else
              copay = @result.nzcostusd
            end
            
            temparray = [card, rate, "Air New Zealand", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "asiana"
            if @result.ozcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.ozcostpts * 100
            end
            
            miles_required = @result.ozcostpts
            if @result.ozcostusd.nil?
              copay = 0
            else
              copay = @result.ozcostusd
            end
            
            temparray = [card, rate, "Asiana", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "china_eastern"
            if @result.mucostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.mucostpts * 100
            end
            
            miles_required = @result.mucostpts
            if @result.mucostusd.nil?
              copay = 0
            else
              copay = @result.mucostusd
            end
            
            temparray = [card, rate, "China Eastern", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "china_southern"
            if @result.czcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.czcostpts * 100
            end
            
            miles_required = @result.czcostpts
            if @result.czcostusd.nil?
              copay = 0
            else
              copay = @result.czcostusd
            end
            
            temparray = [card, rate, "China Southern", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "emirates"
            if @result.ekcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.ekcostpts * 100
            end
            
            miles_required = @result.ekcostpts
            if @result.ekcostusd.nil?
              copay = 0
            else
              copay = @result.ekcostusd
            end
            
            temparray = [card, rate, "Emirates", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "gol"
            if @result.g3costpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.g3costpts * 100
            end
            
            miles_required = @result.g3costpts
            if @result.g3costusd.nil?
              copay = 0
            else
              copay = @result.g3costusd
            end
            
            temparray = [card, rate, "Gol", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "hainan"
            if @result.hucostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.hucostpts * 100
            end
            
            miles_required = @result.hucostpts
            if @result.hucostusd.nil?
              copay = 0
            else
              copay = @result.hucostusd
            end
            
            temparray = [card, rate, "Hainan", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "jal"
            if @result.jlcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.jlcostpts * 100
            end
            
            miles_required = @result.jlcostpts
            if @result.jlcostusd.nil?
              copay = 0
            else
              copay = @result.jlcostusd
            end
            
            temparray = [card, rate, "JAL", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "miles_and_more"
            if @result.lhcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.lhcostpts * 100
            end
            
            miles_required = @result.lhcostpts
            if @result.lhcostusd.nil?
              copay = 0
            else
              copay = @result.lhcostusd
            end
            
            temparray = [card, rate, "Lufthansa", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "saudi_arabian"
            if @result.svcostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.svcostpts * 100
            end
            
            miles_required = @result.svcostpts
            if @result.svcostusd.nil?
              copay = 0
            else
              copay = @result.svcostusd
            end
            
            temparray = [card, rate, "Saudia/Saudi Arabian", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          when "virgin_australia"
            if @result.vacostpts.nil?
              percentage = 0
            else
              percentage = ((card.first_purchase_bonus + card.spend_bonus + card.spend_requirement) * rate.transferratio) / @result.vacostpts * 100
            end
            
            miles_required = @result.vacostpts
            if @result.vacostusd.nil?
              copay = 0
            else
              copay = @result.vacostusd
            end
            
            temparray = [card, rate, "Virgin Australia", percentage, miles_required, copay]
            #debug_string = "la"
            if percentage > 0
              @result.arrayofcards.push(temparray)
            end
          else
            #@debug_string << " Else reached."
            puts "Else reached in results controller."
          end
          
          
          #add card to 'wallet' of results
          #add transfer rate info
          #add relevant pts and usd cost (good luck figuring out which is relevant in a clean way)
        end
      end
    end
    
    #@result.name=debug_string
    #@result.arrayofcards.sort! { |a,b| a.name <=> b.name }
    puts @result.arrayofcards.inspect
    @result.arrayofcards.sort_by!{ |e| e[3].nil? ? 0 : e[3] }.reverse!
    
    #@result.issuer = @result.arrayofcards[0][0].issuer
    #percentage = ((@result.arrayofcards[0][0].first_purchase_bonus + @result.arrayofcards[0][0].spend_bonus + @result.arrayofcards[0][0].spend_requirement) * @result.arrayofcards[0][1].transferratio) / @result.aacostpts * 100
    
    #@result.percentage = percentage
    
    #wallet.each do |c|
    #
    #end
  end
  
  def new
    #@trip = Trip.new
  end
  
  def edit
    #@trip = Trip.find(params[:id])
  end
  
  def create
    #@trip = Trip.create(trip_check) #bleh
    
    #if @trip.save
    #  redirect_to @trip
    #else
    #  render 'new'
    #end
    
  end
  
  def update 
    #@trip = Trip.find(params[:id])
    
    #if @trip.update(trip_check)
    #  redirect_to @trip
    #else
    #  render 'edit'
    #end
    
  end
  
  def destroy
    #@trip = Trip.find(params[:id])
    #@trip.destroy
    
    #redirect_to trips_path
  end
  
  private
    #require all new entries to have these four fields, at a minimum, INCLUDING notes
    def result_check
      params.require(:result).permit(:name,
                                   :costinusd,
                                   :aacostpts,
                                   :aacostusd,
                                   :bacostpts,
                                   :bacostusd,
                                   :uacostpts,
                                   :uacostusd,
                                   :dlcostpts,
                                   :dlcostusd,
                                   :ascostpts,
                                   :ascostusd,
                                   :nkcostpts,
                                   :nkcostusd,
                                   :sqcostpts,
                                   :sqcostusd,
                                   :lacostpts,
                                   :lacostusd,
                                   :accostpts,
                                   :accostusd)
    end
end