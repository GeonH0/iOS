//
//  VoiceRecorderViewModel.swift
//  voiceMemo
//

import AVFoundation

class VoiceRecorderViewModel : NSObject,ObservableObject, AVAudioPlayerDelegate {
    //NSObject 상속 받는 이유? -> AVAudioPlayerDelegate를 채택하여 객체를 구현하기 위해서, 간접적으로 runtime 메커니즘을 사용할수 있게 된다.
    @Published var isDisplayRemoveVoiceRecorderAlert : Bool
    @Published var isDisplayAlert : Bool
    @Published var AlertMessage : String
    
    // 음성 메모 녹은 관련
    var audioRecorder : AVAudioRecorder?
    @Published var isRecording : Bool
    
    
    //음성 메모 재생 관련
    var audioPlayer : AVAudioPlayer?
    @Published var isPlaying : Bool
    @Published var isPaused : Bool
    @Published var playedTime : TimeInterval
    private var progressTimer : Timer?
    
    //음성메모된 파일
    var recordedFiles : [URL]
    
    @Published var selectedRecoredFile : URL?
    
    init(
        isDisplayRemoveVoiceRecorderAlert: Bool = false,
        isDisplayErrorAlert: Bool = false,
        errorAlertMessage: String = "",
        isRecording: Bool = false,
        isPlaying: Bool = false,
        isPaused: Bool = false,
        playedTime: TimeInterval = 0 ,
        recordedFiles: [URL] = [],
        selectedRecoredFile: URL? = nil) {
            self.isDisplayRemoveVoiceRecorderAlert = isDisplayRemoveVoiceRecorderAlert
            self.isDisplayAlert = isDisplayErrorAlert
            self.AlertMessage = errorAlertMessage
            self.isRecording = isRecording
            self.isPlaying = isPlaying
            self.isPaused = isPaused
            self.playedTime = playedTime
            self.recordedFiles = recordedFiles
            self.selectedRecoredFile = selectedRecoredFile
        }
    
}

extension VoiceRecorderViewModel {
    
    func voiceRecordCellTapped(_ recordedFile : URL) {
        if selectedRecoredFile != recordedFile {
            //현재 값과 다른 셀을 클릭할 경우
            
            // TODO: - 재생 정지 메소드 호출
            stopPlaying()
            
            selectedRecoredFile = recordedFile
            
        }
    }
    
    func removeBtnTapped() {
        // TODO: - 삭제 얼럿 노출을 위한 상태 변경 메서드 호출
        setIsDisplayRemoveVoiceRecorderAlert(true)
    }
    
    func removeSelectedVoiceRecord() {
        guard let fileToRemove = selectedRecoredFile,
              let indexToRemove = recordedFiles.firstIndex(of: fileToRemove) else {
            // TODO: - 선택된 음성 메모를 찾을수 없다는 에러 노출
            displayAlert(message: "선택된 음성메모 파일을 찾을 수 없습니다.")
            return
        }
        do {
            try FileManager.default.removeItem(at: fileToRemove)
            recordedFiles.remove(at: indexToRemove)
            selectedRecoredFile = nil
            // TODO: - 재생 정지 메서드 호출
            stopPlaying()
            // TODO: - 삭제 성공 얼럿 노출
            displayAlert(message: "선택된 음성 메모 파일을 성공적으로 삭제했습니다.")
        } catch {
            // TODO: - 삭제 실패 오류 얼럿 노출
            displayAlert(message: "선택된 음성 메모 파일 삭제 중 오류가 발생했습니다.")
        }
    }
    
    private func setIsDisplayRemoveVoiceRecorderAlert(_ isDisplay : Bool) {
        isDisplayRemoveVoiceRecorderAlert = isDisplay
    }
    
    private func setErrorAlertMessage(_ message : String ){
        AlertMessage = message
    }
    
    private func setIsDisplayErrorAlert(_ isDisplay : Bool) {
        isDisplayAlert = isDisplay
    }
    
    private func displayAlert (message : String){
        setErrorAlertMessage(message)
        setIsDisplayErrorAlert(true)
    }
}


// MARK: - 음성메모 녹음 관련
extension VoiceRecorderViewModel {
    func recordBtnTapped() {
        selectedRecoredFile = nil
        if isPlaying {
            // TODO: - 재생 정지 메서드 호출
            stopPlaying()
            // TODO: - 재생 시작 메서드 호출
            startRecording()
        } else if isRecording {
            // TODO: - 녹음 정지 메서드 호출
            stopRecording()
        } else {
            // TODO: - 녹음 시작 메서드 호출
            startRecording()
        }
    }
    
    private func startRecording() {
        
        let fileURL = getDocumentsDirectory().appendingPathComponent("새로운 녹음 \(recordedFiles.count + 1)")
        let settings = [
            AVFormatIDKey : Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey : 12000,
            AVNumberOfChannelsKey : 1,
            AVEncoderAudioQualityKey : AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: fileURL, settings: settings)
            audioRecorder?.record()
            self.isRecording = true
        } catch {
            displayAlert(message: "음성메모 녹음 중 오류가 발생했습니다.")
        }
    }
    
    private func stopRecording() {
        audioRecorder?.stop()
        self.recordedFiles.append(self.audioRecorder!.url)
        self.isRecording = false
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

// MARK: - 음성메모 재생 관련
extension VoiceRecorderViewModel {
    func startPlaying(recodingURL: URL){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: recodingURL)
            audioPlayer?.delegate = self
            audioPlayer?.play()
            self.isPlaying = true
            self.isPaused = false
            self.progressTimer = Timer.scheduledTimer(
                withTimeInterval: 0.1,
                repeats: true
            ) { _ in
                //TODO: - 현재 시간 업데이트 메서드 호출
                
            }
        } catch {
            displayAlert(message: "음성메모 재생 중 오류가 발생했습니다.")
        }
    }
    
    private func updateCurrentTime() {
        self.playedTime = audioPlayer?.currentTime ?? 0
        
    }
    
    private func stopPlaying() {
        audioPlayer?.stop()
        playedTime = 0
        self.progressTimer?.invalidate()
        self.isPlaying = false
        self.isPaused = false
    }
    
    func pausePlaying() {
        audioPlayer?.pause()
        self.isPaused  = true
    }
    func resumPlaying() {
        audioPlayer?.play()
        self.isPaused = false
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        self.isPlaying = false
        self.isPaused = false
    }
    
    func getFileInfo(for url: URL) ->(Date? ,TimeInterval?){
        let fileManager = FileManager.default
        var creationDate : Date?
        var duration : TimeInterval?
        
        do {
            let fileAttributes = try fileManager.attributesOfItem(atPath: url.path)
            creationDate = fileAttributes[.creationDate] as? Date
        } catch {
            displayAlert(message: "선택된 음성메모 파일 정보를 불러올 수 없습니다.")
        }
        
        do {
            let auioPlayer = try AVAudioPlayer(contentsOf: url)
            duration = auioPlayer.duration
        } catch {
            displayAlert(message: "선택된 음성메모 파일의 재생 시간을 불러올 수 없습니다.")
        }
        return (creationDate,duration)
    }
}
