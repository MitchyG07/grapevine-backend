require 'csv'

csv_text = File.read('db/winemag-data-130k-v2.csv')

csv = CSV.parse(csv_text, :headers => true)

varieties = csv.map { |w| w.['variety'] }.uniq  

Wine.destroy_all

csv.each do |r|
    Wine.create(
        title: r["title"],
        description: r["description"],
        variety: r["variety"],
        designation: r["designation"],
        country: r["country"],
        province: r["province"],
        winery: r["winery"],
        points: r["points"]
    )

varieties.each do |v| 
    Variety.create (
        type: v 
    )
end 
