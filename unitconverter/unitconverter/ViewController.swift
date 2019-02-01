//
//  ViewController.swift
//  unitconverter
//
//  Created by abhagat00 on 1/21/19.
//  Copyright © 2019 abhagat00. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var tempr: TempratureRange!
    @IBOutlet weak var tempratureLabel: UILabel!


    @IBOutlet weak var tempraturePicker: UIPickerView!

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textLabel: UILabel!

    @IBAction func indexChanged(_ sender: Any) {

      switch segmentedControl.selectedSegmentIndex
        {
      case 0:
        tempraturePicker.reloadAllComponents();
        textLabel.text = "Temperature output displayed in °F";


      case 1:
        tempraturePicker.reloadAllComponents();
        textLabel.text = "Temperature output displayed in °C";
      default:
        break
        }


    }



//    private var tempratureValues = [Int] ()
//    private let tempratureValues = (-100...100).map { $0 }
    let unitConverter = UnitConverter()

    let userDefaultsLastRowKey = "defaultCelciusPickerRow"

//    $0 represents the values from -100 to 0100
//    for examples
//   private var tempratureValues = (-100...100).map { $0 > 5 }

    override func viewDidLoad() {
        super.viewDidLoad()
//        tempraturePicker.dataSource = self;


        tempraturePicker.delegate = self;
        let defaultPickerRow = initialPickerRow()
        tempraturePicker.selectRow(defaultPickerRow, inComponent: 0, animated: true)
        pickerView(tempraturePicker, didSelectRow: defaultPickerRow, inComponent: 0)


//        let lowerBound = -100
//        let upperBound = 100
//        for index in -100...100{
//            tempratureValues.append(index)
//        }
//
    }


    func initialPickerRow() -> Int {
        if let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int{
            return savedRow
        }
        return tempraturePicker.numberOfRows(inComponent: 0) / 2
    }

    func saveSelectedRow(row: Int){
    let defaults = UserDefaults.standard
        defaults.set(row,forKey:"DefaultCelciusPickerRow")
        defaults.synchronize()
    }


    func displayConvertedTempratureForRow(row: Int)
            {
             tempraturePicker.reloadAllComponents();

                 let tempValue = tempr.values[row]
                if(segmentedControl.selectedSegmentIndex==0 )
                {
//                    let celciusValue = tempr.values[row]

                    tempratureLabel.text = "\(unitConverter.degreesFahrenheit(degreesCelcius: tempValue))°F"
                }
                else{

                    tempratureLabel.text = "\(unitConverter.degreesCel(degreesFah: tempValue))°C"
                }

            }

}

extension ViewController : UIPickerViewDelegate {
//    /data source
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//
//        return tempratureValues.count
//    }
//    delegates

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if(segmentedControl.selectedSegmentIndex==0 ){
//            tempraturePicker.reloadAllComponents();
             return "\(tempr.values[row])°C"

        }
        else{
//             tempraturePicker.reloadAllComponents();
             return "\(tempr.values[row])°F"
        }

    }


    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//       let degressCelcius = Float(tempratureValues[row])
//        let degreesFahrenheit = 1.8 * degressCelcius + 32.0
//        tempratureLabel.text = "\(Int(degreesFahrenheit))°f"


        displayConvertedTempratureForRow(row: row)
        saveSelectedRow(row: row)

    }
}
