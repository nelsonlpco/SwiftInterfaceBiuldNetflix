//
//  ViewController.swift
//  NetflixLegado
//
//  Created by Nelson Prado on 12/01/21.
//

import UIKit

class FeedMovieViewController: UITableViewController {
    let cellId = "cellid"
    var moviesMock: MovieMock?
    
    let progressView: UIActivityIndicatorView = {
        let p = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        p.backgroundColor = .black
        p.translatesAutoresizingMaskIntoConstraints = false
        p.startAnimating()
        return p
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupIndicatorView()
        setupViews()
        let api = NetflixApi.shared
        api.delegate = self
        api.request()
    }
    
    private func setupViews() {
        tableView.register(FeedMovieTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.backgroundColor = UIColor.fromHex(0x313131)
        tableView.separatorStyle = .none
    }
    
    private func setupIndicatorView() {
       guard let window = UIApplication
            .shared
            .connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
                .filter({$0.isKeyWindow}).first else { return }
        
        window.addSubview(progressView)
        window.bringSubviewToFront(progressView)
        
        window.constraint(pattern: "H:|[v0]|", views: progressView)
        window.constraint(pattern: "V:|[v0]|", views: progressView)
    }

    
    
    //MARK: - TABLE VIEW
    override func numberOfSections(in tableView: UITableView) -> Int {
        return moviesMock?.movies.keys.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! FeedMovieTableViewCell
        
        cell.type = indexPath.section == 0
        
        if let movies = moviesMock?.movies {
            cell.movies = movies[indexPath.section]?.1
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = tableView.frame.width  * 0.6
        return width * (3/4)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        headerView.backgroundColor = UIColor.fromHex(0x313131)
        
        if let movies = moviesMock?.movies {
            let label = UILabel(frame: .zero)
            label.text =  movies[section]?.0
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 14)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            headerView.addSubview(label)
            
            headerView.constraint(pattern: "H:|-8-[v0]|", views: label)
            headerView.constraint(pattern: "V:|[v0]|", views: label)
        }
        
        return headerView
    }
    
}

extension FeedMovieViewController: FeedMovieDelegate {
    func response(status: Int, feed: MovieMock) {
        self.progressView.removeFromSuperview()
        
        if status == 200 {
            self.moviesMock = feed
            tableView?.reloadData()
        }
    }
}

