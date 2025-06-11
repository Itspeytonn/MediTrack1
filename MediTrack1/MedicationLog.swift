
import SwiftUI
import SwiftData
struct MedicationLog: View {
  @Query private var logs: [Log]
  @Environment(\.modelContext) private var context
  @State private var newMedicationName = ""
  @State private var newLogDate = Date.now
  @State private var selectedLog: Log?
  //end array
    var body: some View {
        ZStack {
            //Color("") // Or any custom color
                //.ignoresSafeArea()
            NavigationStack {
                List {
                    ForEach(logs) { log in
                        HStack {
                            Text(log.medicationName)
                            Spacer()
                            Text(log.logDate, format: .dateTime.month(.wide).day().year())
                        }
                        //end hstack
                        .onTapGesture {
                            selectedLog = log
                        }
                        .listRowBackground(Color.white)

                    }
                    .onDelete(perform: deleteLog)
                }
                //end list
                .navigationTitle("Medicine")
                .scrollContentBackground(.hidden) // ← Hides default list bg
                .background(Color("darkPink")) // ← Adds your color
                
                
                .sheet(item: $selectedLog) { log in
                    NavigationStack {
                        EditLog(log: log)
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    
                    
                    //user enters name and date
                    VStack(alignment: .center, spacing: 20) {
                        Text("Log New Medication")
                            .font(.headline)
                        DatePicker(selection: $newLogDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                            TextField("Name", text: $newMedicationName)
                                .textFieldStyle(.roundedBorder)
                        }
                        Button("Log") {
                            let newLog = Log(medicationName: newMedicationName, logDate: newLogDate)
                            context.insert(newLog)
                            newMedicationName = ""
                            newLogDate = .now
                        }
                        //end button
                        .bold()
                    }
                    //end VStack
                    .padding()
                    //.background(.bar)
                    .background(Color("theme"))
                }
                .background(Color("lightPink"))
                
                //end safenet
            }
            //end nav stack
        }
        //end body view
    }
    //zstack
    
    func deleteLog(at offsets: IndexSet) {
        for index in offsets {
            let log = logs[index]
            context.delete(log)
        }
    }
}
//end content
#Preview {
  MedicationLog()
    .modelContainer(for:Log.self, inMemory: true)
}
